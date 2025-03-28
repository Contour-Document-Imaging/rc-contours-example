package com.rc.contour.sdk.example

import android.os.Bundle
import android.util.Base64
import android.widget.Button
import androidx.appcompat.app.AppCompatActivity
import com.contourdocumentimaging.sdk.contour_rc.callbacks.IContourResultListener
import com.contourdocumentimaging.sdk.contour_rc.modules.RCContour
import com.contourdocumentimaging.sdk.contour_rc.modules.base.model.RCContourModel

class MainActivity: AppCompatActivity() {

    private lateinit var buttonOpenSdk: Button

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        buttonOpenSdk = findViewById(R.id.openSDK)
        buttonOpenSdk.setOnClickListener {
            val contourModel = RCContourModel()
            contourModel.clientId = ""
            contourModel.token = ""
            RCContour.launchSdk(this, contourModel, object: IContourResultListener {
                override fun onSDKClosed() {

                }
            })
        }

    }
}