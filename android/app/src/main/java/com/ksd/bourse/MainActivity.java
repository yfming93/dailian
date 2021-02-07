package com.ksd.bourse;

import android.content.Context;
import android.os.Bundle;

import androidx.annotation.NonNull;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

    }

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);
        registerCustomPlugin(flutterEngine.getDartExecutor().getBinaryMessenger(), this);

    }


    public static void registerCustomPlugin(BinaryMessenger messenger, Context context) {
        com.ksd.laiyue.fluttersdk.FlutterYidunCaptchaPlugin.registerWith2(messenger, context);
    }


}
