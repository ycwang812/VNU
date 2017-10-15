package com.example.smsdemo;

import android.os.Bundle;
import android.telephony.SmsManager;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;
import android.app.Activity;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;

public class MainActivity extends Activity {

	private EditText txtPhoneNo, txtMessage;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);

		// 取得EditText元件
		txtPhoneNo = (EditText) findViewById(R.id.txtPhoneNo);
		txtMessage = (EditText) findViewById(R.id.txtMessage);
	}

	// Button元件的事件處理 - 寄送簡訊
	public void btnSendSMS_Click(View view) {
		// 取得簡訊內容
		String phoneNo = txtPhoneNo.getText().toString();
		String message = txtMessage.getText().toString();
		
		if (phoneNo.length() > 0 && message.length() > 0) {
			sendSMS(phoneNo, message); // 送出簡訊
		} else {
			Toast.makeText(this, "請確認輸入電話號碼和訊息內容!", Toast.LENGTH_SHORT).show();
		}
	}

	// 寄送簡訊
	private void sendSMS(String phoneNumber, String message) {
		String SENT = "SMS_SENT";
		String DELIVERED = "SMS_DELIVERED";
		
		// 當簡訊已經送出, 建立廣播接收器來取得結果
		registerReceiver(new BroadcastReceiver() {
			
			@Override
			public void onReceive(Context content, Intent intent) {
				switch (getResultCode()) {
					case Activity.RESULT_OK:
						Toast.makeText(getBaseContext(), "簡訊送出", Toast.LENGTH_SHORT).show();
						break;
					case SmsManager.RESULT_ERROR_GENERIC_FAILURE:
						Toast.makeText(getBaseContext(), "一般錯誤!", Toast.LENGTH_SHORT).show();
						break;
					case SmsManager.RESULT_ERROR_NO_SERVICE:
						Toast.makeText(getBaseContext(), "沒有服務!", Toast.LENGTH_SHORT).show();
						break;
					case SmsManager.RESULT_ERROR_NULL_PDU:
						Toast.makeText(getBaseContext(), "空的PDU", Toast.LENGTH_SHORT).show();
						break;
					case SmsManager.RESULT_ERROR_RADIO_OFF:
						Toast.makeText(getBaseContext(), "沒有訊號", Toast.LENGTH_SHORT).show();
						break;
				}
			}
		}, new IntentFilter(SENT));
		
		// 當簡訊已經送達, 建立廣播接收器來取得結果
		registerReceiver(new BroadcastReceiver() {
			
			@Override
			public void onReceive(Context content, Intent intent) {
				switch (getResultCode()) {
					case Activity.RESULT_OK:
						Toast.makeText(getBaseContext(), "簡訊已經送達!", Toast.LENGTH_SHORT).show();
						break;
					case Activity.RESULT_CANCELED:
						Toast.makeText(getBaseContext(), "簡訊沒有送達!", Toast.LENGTH_SHORT).show();
						break;
				}
			}
		}, new IntentFilter(DELIVERED));
		
		// 建立PendingIntent物件
		PendingIntent sentPI = PendingIntent.getBroadcast(this, 0, new Intent(SENT), 0);
		PendingIntent deliveredPI = PendingIntent.getBroadcast(this, 0, new Intent(DELIVERED), 0);
		
		// 取得SmsManager物件
		SmsManager sms = SmsManager.getDefault();
		
		// 送出簡訊
		sms.sendTextMessage(phoneNumber, null, message, sentPI, deliveredPI);
	}

}
