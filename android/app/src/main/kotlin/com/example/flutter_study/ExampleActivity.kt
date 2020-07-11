package com.example.flutter_study

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import android.view.View
import android.widget.EditText

/**
 *   @author 夜斗
 *   @date 2020/7/8
 *   Class 描述 :
 */
class ExampleActivity : Activity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_example_layout)
    }

    fun closeActivity(view: View) {
        val editText = findViewById<EditText>(R.id.example_edit).text.toString()
        val intent=Intent()
        intent.putExtra("result_info", editText)
        setResult(1,intent)
        finish()
    }

}