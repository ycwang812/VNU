package com.example.mediaplayerdemo;

import android.app.Service;
import android.content.Intent;
import android.media.MediaPlayer;
import android.media.MediaPlayer.OnCompletionListener;
import android.os.IBinder;
import android.util.Log;

public class MusicService extends Service {
	
	private MediaPlayer player;
	private String musicFile = "/sdcard/Kalimba.mp3";

	@Override
	public void onCreate() {
		// 建立MediaPlayer物件
		player = new MediaPlayer();
		
		try {
			// 取得MP3音樂
			player.setDataSource(musicFile);
			// 指定建立傾聽者物件
			player.setOnCompletionListener(new OnCompletionListener() {
				
				@Override
				public void onCompletion(MediaPlayer mp) {
					try {
		    			player.stop(); // 停止播放
		    			player.prepare();
		    		} catch (Exception ex){
		    			Log.d("MediaPlayerDemo", "OnCompletionListener: " + ex.getMessage());
		    		}
				}
			});
			player.prepare();
		} catch (Exception ex) {
			Log.d("MediaPlayerDemo", "onCreate: " + ex.getMessage());
		}
	}
	
	@Override
	public int onStartCommand(Intent intent, int flags, int startId) {
		// 是否是暫停
		Boolean isPause = intent.getBooleanExtra("ISPAUSE", true);
		
		try {
			if (isPause == true) {
				// 是否是在播放中
				if (player.isPlaying() == true)
					player.pause(); // 是, 所以暫停
			} else {
				// 不是暫停
				player.start(); // 開始播放
			}
		} catch (Exception ex) {
			Log.d("MediaPlayerDemo", "onStart(): " + ex.getMessage());
		}
		
		return START_STICKY;
	}
	
	@Override
	public void onDestroy() {
		try {
			player.stop(); // 停止播放
			player.prepare();
		} catch (Exception ex) {
			Log.d("MediaPlayerDemo", "onDestroy(): " + ex.getMessage());
		}
	}
	
	@Override
	public IBinder onBind(Intent intent) {
		return null;
	}

}
