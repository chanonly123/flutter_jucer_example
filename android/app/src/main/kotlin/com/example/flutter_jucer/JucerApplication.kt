package com.example.flutter_jucer

import android.app.Application
import com.rmsl.juce.Java

class JucerApplication: Application() {

    private external fun juce_init()

    override fun onCreate() {
        super.onCreate()
        Java.initialiseJUCE(this)
        juce_init();
    }
}