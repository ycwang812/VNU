package com.example.smsdemo;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.telephony.SmsMessage;
import android.widget.Toast;

public class SMSReceiver extends BroadcastReceiver {

	@Override
	public void onReceive(Context context, Intent intent) {
		// 取得收到的簡訊內容
		Bundle bundle = intent.getExtras();
		SmsMessage[] msgs = null;
		String str = "";
		
		// 如果有內容
		if (bundle != null) {
			// 取出訊息內容
			Object[] pdus = (Object[]) bundle.get("pdus");
			msgs = new SmsMessage[pdus.length];
			
			for (int i = 0; i < msgs.length; i++) {
				msgs[i] = SmsMessage.createFromPdu((byte[]) pdus[i]);
				str += "SMS from " + msgs[i].getOriginatingAddress();
				str += " :";
				str += msgs[i].getMessageBody().toString();
				str += "\n";
			}
			
			// 顯示取得的訊息內容
			Toast.makeText(context, str, Toast.LENGTH_LONG).show();
		}
	}

}
