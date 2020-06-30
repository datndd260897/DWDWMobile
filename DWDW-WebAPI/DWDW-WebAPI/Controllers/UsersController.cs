﻿using DWDW_WebAPI.Firebase;
using DWDW_WebAPI.Models;
using DWDW_WebAPI.Services;
using DWDW_WebAPI.ViewModel;
using System;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Security.Claims;
using System.Text;
using System.Web.Http;
using System.Web.Http.Description;
using System.Threading.Tasks;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Web.Script.Serialization;
using System.Collections.Generic;
using DWDW_WebAPI.Contants;

namespace DWDW_WebAPI.Controllers
{
    [RoutePrefix("v1/api/Users")]
    public class UsersController : BaseController
    {
        private IUserService userService;
        private ModelMapping modelMapping;

        public UsersController()
        {
            this.userService = new UserService(new DWDBContext());
            this.modelMapping = new ModelMapping();
        }

        //[Route("getAuthorizedUserInfo")]
        //[HttpGet]
        //[Authorize]
        //public IHttpActionResult getUser()
        //{
        //    var user = this.GetIndentiy();
        //    return Ok(user);
        //}

        [Route("Login")]
        [AllowAnonymous]
        [HttpPost]
        public async Task<IHttpActionResult> Login(string username, string password)
        {
            string jwt_token = "";
            try
            {
                var user = await userService.LoginAsync(username, password);
                if (user != null)
                {

                    string key = Constant.SECRET_KEY; //Secret key which will be used later during validation    
                    var issuer = Constant.URL;  //normally this will be your site URL   

                    var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(key));
                    var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);

                    //Create a List of Claims, Keep claims name short    

                    var permClaims = createClaims(user);

                    //Create Security Token object by giving required parameters    
                    var token = new JwtSecurityToken(issuer, //Issure    
                                    issuer,  //Audience    
                                    permClaims,
                                    expires: DateTime.Now.AddDays(1),
                                    signingCredentials: credentials);

                    jwt_token = new JwtSecurityTokenHandler().WriteToken(token);

                }

            }
            catch (Exception e)
            {

                return BadRequest(e.ToString());
            }

            return Ok(new { data = jwt_token });
        }

        private List<Claim> createClaims(UserViewModel user)
        {
            var permClaims = new List<Claim>();
            permClaims.Add(new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()));
            permClaims.Add(new Claim("id", user.userId.ToString()));
            permClaims.Add(new Claim("username", user.userName));
            permClaims.Add(new Claim("roleId", user.roleId.ToString()));

            return permClaims;
        }

        // GET ALL User for admin
        //[Authorize(Roles = Constant.ADMIN_ROLE)]
        [HttpGet]
        public IHttpActionResult GetUsers()
        {
            var userList = userService.GetUsers();
            return Ok(userList);
        }
        //hoang
        //?
        //Get user detail
        //[Authorize(Roles = Constant.ADMIN_ROLE + "," + Constant.MANAGER_ROLE + "," + Constant.WORKER_ROLE)]
        //[HttpGet]
        //[Route("detail")]
        //public IHttpActionResult GetAccountDetail()
        //{
        //    var identity = (ClaimsIdentity)User.Identity;
        //    var ID = identity.Claims.FirstOrDefault(c => c.Type == "ID").Value;
        //    var currentAccount = userService.GetUserById(int.Parse(ID));
        //    return Ok(currentAccount);
        //}
        //api cũ là search user, nhưng theo id
        //[Authorize(Roles = Constant.ADMIN_ROLE)]
        [HttpGet]
        [Route("{userId}")]
        [ResponseType(typeof(User))]
        public IHttpActionResult GetUserById(int userId)
        {
            var user = userService.GetUserById(userId);
            if (user == null)
            {
                return NotFound();
            }
            return Ok(user);
        }

        //hoang
        //Update device Token
        //[Authorize(Roles = Constant.MANAGER_ROLE)]
        //[HttpPut]
        //[Route("api/managerToken/{deviceToken}")]
        //public void PutToken(string deviceToken)
        //{
        //    var identity = (ClaimsIdentity)User.Identity;
        //    int id = int.Parse(identity.Claims.FirstOrDefault(c => c.Type == "ID").Value);
        //    using (db)
        //    {
        //        var entity = db.Users.FirstOrDefault(e => e.userId == id);
        //        entity.deviceToken = deviceToken;
        //        db.SaveChanges();
        //    }
        //}


        // PUT: api/Users/5
        [HttpPut]
        [Route("")]
        [ResponseType(typeof(void))]
        public IHttpActionResult PutUser(int id, UserViewModel userViewModel)
        {
            try
            {
                if (!ModelState.IsValid) return BadRequest(ModelState);
                if (userViewModel.userId != id) return BadRequest();
                User user = userService.GetUserById(id);
                if (user == null) return NotFound();
                modelMapping.UpdateUserMapping(userViewModel, user);
                if (userService.UpdateUser(user))
                {
                    return Ok("Update succeed.");
                }
                else
                {
                    return BadRequest("Can not update User.");
                }
            }
            catch (DbUpdateConcurrencyException)
            {
                return InternalServerError();
            }
        }

        // POST: api/Users
        [HttpPost]
        [Route("")]
        [ResponseType(typeof(User))]
        public IHttpActionResult PostUser(UserViewModel userViewModel)
        {
            try
            {
                if (!ModelState.IsValid) return BadRequest(ModelState);
                //mapping
                User user = modelMapping.CreateUserMapping(userViewModel);
                if (userService.InsertUser(user))
                {
                    return Ok("Insert succeed.");
                }
                else
                {
                    return BadRequest("Can not insert User.");
                }
            }
            catch (DbUpdateConcurrencyException)
            {
                if (userService.UserExists(userViewModel.userId))
                {
                    return Conflict();
                }
                return InternalServerError();
            }
        }

        // PUT Deactive: api/Users/5
        [HttpPut]
        [Route("{userId}/deactive")]
        [ResponseType(typeof(User))]
        public IHttpActionResult PutUserDeactive(int userId)
        {
            try
            {
                if (!ModelState.IsValid) return BadRequest(ModelState);
                User user = userService.GetUserById(userId);
                if (user == null) return NotFound();
                if (user.isActive.Equals(false))
                {
                    return BadRequest("Location already deactivated.");
                }
                //mapping
                if (userService.DeactiveUser(user))
                {
                    return Ok("Deactive succeed.");
                }
                else
                {
                    return BadRequest("Can not deactive Location.");
                }
            }
            catch (DbUpdateConcurrencyException)
            {
                return InternalServerError();
            }
        }

    }
}