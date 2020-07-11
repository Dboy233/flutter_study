package com.example.flutter_study

import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Build.VERSION
import android.os.Build.VERSION_CODES
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler


class MainActivity : FlutterActivity(), MethodCallHandler {
    val CHANNEL_NAME = "example.platform/nativeMethod"

    /**
     * Android 获取电量
     */
    val android_method_get_battery_level = "getBatteryLevel"

    /**
     * Android 方法 打开示例activity
     */
    val android_method_open_example_activity="openExampleActivity"

    /**
     * flutter中的方法 改变消息信息
     */
    val flutter_method_change_msg="changeMsg"


    lateinit var methodChannel: MethodChannel

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        methodChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL_NAME)
        methodChannel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        if (call.method == android_method_get_battery_level) {
            var batteryLevel = getBatteryLevel()
            if (batteryLevel != -1) {
                result.success("当前电量 $batteryLevel")
            } else {
                result.error("ERROR", "获取电量失败", "失败")
            }
        } else if (call.method == android_method_open_example_activity) {
            openExampleActivity()
        } else {
            //这个平台没有这个方法
            result.notImplemented()
        }
    }

    private fun getBatteryLevel(): Int {
        var batteryLevel = -1
        batteryLevel = if (VERSION.SDK_INT >= VERSION_CODES.LOLLIPOP) {
            val batteryManager = getSystemService(Context.BATTERY_SERVICE) as BatteryManager
            batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
        } else {
            val intent = ContextWrapper(applicationContext).registerReceiver(null, IntentFilter(Intent.ACTION_BATTERY_CHANGED))
            intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100 /
                    intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1)
        }
        return batteryLevel
    }

    private fun openExampleActivity() {
        var intent = Intent(this, ExampleActivity::class.java)
        startActivityForResult(intent, 1)
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        //获取上个页面返回的数据 传递给flutter页面
        if (requestCode == 1) {
            data?.apply {
                val resultInfo = getStringExtra("result_info")
                methodChannel.invokeMethod(flutter_method_change_msg, resultInfo)
            }
        }
    }
}
