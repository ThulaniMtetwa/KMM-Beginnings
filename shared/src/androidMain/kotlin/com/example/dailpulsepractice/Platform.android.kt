package com.example.dailpulsepractice
import android.content.res.Resources
import android.os.Build
import android.util.Log
import kotlin.math.round
import kotlin.math.roundToInt

actual class Platform() {
    actual val name: String
        get() = "Android"
    actual val osVersion: String
        get() = "${Build.VERSION.SDK_INT}"
    actual val deviceModel: String
        get() = "${Build.MANUFACTURER} ${Build.MODEL}"
    actual val density: Int
        get() = round(Resources.getSystem().displayMetrics.density).roundToInt()

    actual fun logSystemInfo() {
        Log.d(
            "Daily Pulse",
            "${name}, ${osVersion}, ${deviceModel}, ${density}"
        )
    }
}