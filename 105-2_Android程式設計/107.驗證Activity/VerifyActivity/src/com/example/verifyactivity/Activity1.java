package com.example.verifyactivity;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.TextView;

public class Activity1 extends Activity {
	
	private static final int REQUEST_CODE = 1;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.main);
		
		Log.i("Android_Log", "onCreate()");
		
		Button go_btn = (Button) findViewById(R.id.go_btn);
		go_btn.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				Intent intent = new Intent(Activity1.this, Activity2.class);
				startActivityForResult(intent, REQUEST_CODE);
			}
		});
		
		Button exit_btn = (Button) findViewById(R.id.exit_btn);
		exit_btn.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				finish();
			}
		});
	}
	
	@Override
	protected void onStart() {
		super.onStart();
		Log.i("Android_Log", "onStart()");
	}
	
	@Override
	protected void onResume() {
		super.onResume();
		Log.i("Android_Log", "onResume()");
	}

	@Override
	protected void onPause() {
		super.onPause();
		Log.i("Android_Log", "onPause()");
	}

	@Override
	protected void onStop() {
		super.onStop();
		Log.i("Android_Log", "onStop()");
	}
	
	@Override
	protected void onRestart() {
		super.onRestart();
		Log.i("Android_Log", "onRestart()");
	}

	@Override
	protected void onDestroy() {
		super.onDestroy();
		Log.i("Android_Log", "onDestroy()");
	}

	@Override
	protected void onActivityResult(int requestCode, int resultCode, Intent data) {
		super.onActivityResult(requestCode, resultCode, data);
		
		switch (requestCode) {
			case REQUEST_CODE:
				TextView result = (TextView) findViewById(R.id.result);
				result.setText(String.valueOf(resultCode));
				break;
		}
	}
	
	
}
