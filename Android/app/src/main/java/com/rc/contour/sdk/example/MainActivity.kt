package com.rc.contour.sdk.example


import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import com.contourdocumentimaging.sdk.contour_rc.callbacks.IContourResultListener
import com.contourdocumentimaging.sdk.contour_rc.modules.RCContour
import com.contourdocumentimaging.sdk.contour_rc.modules.base.model.EnvironmentType
import com.contourdocumentimaging.sdk.contour_rc.modules.base.model.RCContourModel
import com.rc.contour.sdk.example.databinding.ActivityMainBinding

class MainActivity: AppCompatActivity() {

    private lateinit var buttonOpenSdk: Button
    private lateinit var binding: ActivityMainBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        enableEdgeToEdge()
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        buttonOpenSdk = findViewById(R.id.openSDK)
        buttonOpenSdk.setOnClickListener {

            val contourModel = RCContourModel()
            contourModel.clientId = binding.etClientId.text.toString().trim()
            contourModel.token = binding.etToken.text.toString().trim()
            contourModel.environmentType = getEnvironmentTypeFromEditText(binding.etEnvironmentType)
            contourModel.environmentId = binding.etEnvironmentId.text.toString().trim()
            RCContour.launchSdk(this, contourModel, object: IContourResultListener {
                override fun onSDKClosed() {

                }
            })
        }
    }

    private fun getEnvironmentTypeFromEditText(editText: EditText): EnvironmentType? {
        val inputText = editText.text.toString().trim().uppercase()

        return when (inputText) {
            "QA" -> EnvironmentType.QA
            "UAT" -> EnvironmentType.UAT
            "DEV" -> EnvironmentType.DEV
            "PPE" -> EnvironmentType.PPE
            else -> null
        }
    }
}