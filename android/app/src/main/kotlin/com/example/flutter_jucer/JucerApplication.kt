package com.example.flutter_jucer

import android.app.Application
import com.rmsl.juce.Java

class JucerApplication: Application() {

    override fun onCreate() {
        super.onCreate()
        Java.initialiseJUCE(this)
    }
}