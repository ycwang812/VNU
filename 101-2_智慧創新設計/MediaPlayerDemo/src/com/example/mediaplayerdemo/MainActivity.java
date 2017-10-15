package com.example.mediaplayerdemo;

import android.os.Bundle;
import android.app.Activity;
import android.content.Intent;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.TextView;

public class MainActivity extends Activity {
	
	private TextView output;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		
		// 取得TextView元件
        output = (TextView) findViewById(R.id.output);
        
		// Button元件的事件處理
        Button startBtn = (Button) findViewById(R.id.startBtn);
        startBtn.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				Intent intent = new Intent(MainActivity.this, MusicService.class);
				intent.putExtra("ISPAUSE", false); // 不是暫停
				startService(intent);
				output.setText("音樂播放中...");
			}
		});
        
        Button pauseBtn = (Button) findViewById(R.id.pauseBtn);
        pauseBtn.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				Intent intent = new Intent(MainActivity.this, MusicService.class);
				intent.putExtra("ISPAUSE", true);  // 是暫停
				startService(intent);
				output.setText("音樂暫停中...");
			}
		});
        
        Button stopBtn = (Button) findViewById(R.id.stopBtn);
        stopBtn.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				Intent intent = new Intent(MainActivity.this, MusicService.class);
				stopService(intent);
				output.setText("音樂已經停止播放...");
			}
		});
	}

}
