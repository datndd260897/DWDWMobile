package com.example.dwdwproject.repositories.shiftRepositories;

import android.content.Context;

import com.example.dwdwproject.ResponseDTOs.ShiftDTO;
import com.example.dwdwproject.utils.CallBackData;

public class ShiftRepositoriesImpl implements ShiftRepositories {
    @Override
    public void getShiftByManager(Context context, String token, int shiftTime, CallBackData<ShiftDTO> mCallBackData) {

    }

    @Override
    public void getShifByWorker(Context context, String token, CallBackData<ShiftDTO> mCallBackData) {

    }

    @Override
    public void createShift(Context context, String token, ShiftDTO mShiftDTO, CallBackData<String> mCallBackData) {

    }
}
