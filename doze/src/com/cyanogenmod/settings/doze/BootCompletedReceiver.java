package com.cyanogenmod.settings.doze;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.util.Log;

public class BootCompletedReceiver extends BroadcastReceiver {
    static final String TAG = "HisiDoze";

    @Override
    public void onReceive(final Context context, Intent intent) {
        Log.d(TAG, "Booting");
        context.startService(new Intent(context, SensorsDozeService.class));
    }
}