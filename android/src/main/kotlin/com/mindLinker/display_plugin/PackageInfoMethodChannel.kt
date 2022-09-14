package com.mindLinker.display_plugin

import android.content.Context
import android.content.pm.PackageInfo
import android.content.pm.PackageManager
import android.os.Build
import android.util.Log
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler

/**
 * @description：
 * @author：     chenjianrun
 * @date：       2022/9/2 10:09 上午
 */
class PackageInfoMethodChannel(messenger: BinaryMessenger, var context: Context): MethodCallHandler {
    private val methodChannel = MethodChannel(messenger, "com.mindlinker/package_info")

    init {
        methodChannel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        Log.d("package_info", "onMethodCall: method=${call.method}")
        when(call.method) {
            "getPackageInfo" -> {
                val packageName = context.packageName
                val pm: PackageManager = context.packageManager
                val info: PackageInfo = pm.getPackageInfo(packageName, 0)

                val map: MutableMap<String, String> = HashMap()
                map["appName"] = info.applicationInfo.loadLabel(pm).toString()
                map["packageName"] = packageName
                map["version"] = info.versionName
                map["buildNumber"] = getLongVersionCode(info).toString()
                result.success(map)
            }

            else -> {
                result.notImplemented()
            }
        }
    }

    private fun getLongVersionCode(info: PackageInfo): Long {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
            info.longVersionCode
        } else info.versionCode.toLong()
    }

    fun dispose() {
        methodChannel.setMethodCallHandler(null)
    }
}