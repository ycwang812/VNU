package com.example.maildemo;

import android.os.Bundle;
import android.app.Activity;
import android.content.Intent;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;

public class MainActivity extends Activity {

	private EditText address, emailbody;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);

		// 取得郵件內容的EditText元件
		address = (EditText) findViewById(R.id.address);
		emailbody = (EditText) findViewById(R.id.body);
	}

	// Button元件的事件處理 - 寄送電子郵件
	public void send_Click(View view) {
		// 檢查是否有輸入電子郵件地址
		if (!address.getText().toString().trim().equalsIgnoreCase("")) {
			// 建立Intent物件
			Intent eIntent = new Intent(android.content.Intent.ACTION_SEND);
			eIntent.setType("plain/text");
			eIntent.putExtra(Intent.EXTRA_EMAIL, new String[] { address.getText().toString() });
			eIntent.putExtra(Intent.EXTRA_TEXT, emailbody.getText());
			startActivity(Intent.createChooser(eIntent, "寄送電子郵件..."));
		} else {
			Toast.makeText(this, "請輸入電子郵件地址..", Toast.LENGTH_LONG).show();
		}
	}

}
