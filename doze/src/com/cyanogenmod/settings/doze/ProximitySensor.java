package com.cyanogenmod.settings.doze;

import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;

public class ProximitySensor implements SensorEventListener {

    private static final int PROXIMITY_DELAY = 1000 * 1000;
    private static final int PROXIMITY_LATENCY = 100 * 1000;

    private boolean mEnabled;
    private boolean mReady;
    private boolean mState;
    private float mMaxRange;
    private ProximityListener mProximityListener;
    private Sensor mProximitySensor;
    private SensorManager mSensorManager;

    public interface ProximityListener {
        void onEvent(boolean isNear, long timestamp);
        void onInit(boolean isNear, long timestamp);
    }

    public ProximitySensor(Context context, SensorManager sensorManager,
            ProximityListener proximitylistener) {
        mEnabled = false;
        reset();
        mProximitySensor = sensorManager.getDefaultSensor(Sensor.TYPE_PROXIMITY, false);

        mProximityListener = proximitylistener;
        mSensorManager = sensorManager;

        if (mProximitySensor != null) {
            mMaxRange = mProximitySensor.getMaximumRange();
        }
    }

    public void onAccuracyChanged(Sensor sensor, int accuracy) {
    }

    public void onSensorChanged(SensorEvent event) {
        if (event.values.length == 0) return;
        boolean isNear = (event.values[0] < mMaxRange);

        // Launch an event
        if (mState != isNear) {
            mState = isNear;
            if (mReady) {
                mProximityListener.onEvent(mState, event.timestamp);
            }
        }

        // Init the sensor
        if (!mReady) {
            mProximityListener.onInit(mState, event.timestamp);
            mReady = true;
        }
    }

    public void enable() {
        if (!mEnabled && mProximitySensor != null) {
            mSensorManager.registerListener(this, mProximitySensor, PROXIMITY_DELAY,
                    PROXIMITY_LATENCY);
            mEnabled = true;
        }
    }

    public void reset() {
        mReady = false;
        mState = false;
    }

    public void disable() {
        if (mEnabled && mProximitySensor != null) {
            mSensorManager.unregisterListener(this, mProximitySensor);
            mEnabled = false;
        }
    }
}