package com.example.whereamidemo;

import android.location.Criteria;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.net.Uri;
import android.os.Bundle;
import android.provider.Settings;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.TextView;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;

public class MainActivity extends Activity {

	private LocationManager manager;
	private Location currentLocation; 
	private String best;
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		
		// 取得系統服務的LocationManager物件
		manager = (LocationManager) getSystemService(LOCATION_SERVICE);
		
		// 檢查是否有啟用GPS
		if (!manager.isProviderEnabled(LocationManager.GPS_PROVIDER)) {
			
			// 顯示對話方塊啟用GPS
			AlertDialog.Builder builder = new AlertDialog.Builder(this);
			builder.setTitle("定位管理")
					.setMessage("GPS目前狀態是尚未啟用.\n" + "請問你是否現在就設定啟用GPS?")
					.setPositiveButton("啟用",
							new DialogInterface.OnClickListener() {
						
								@Override
								public void onClick(DialogInterface dialog, int which) {
									// 使用Intent物件啟動設定程式來更改GPS設定
									Intent i = new Intent(Settings.ACTION_LOCATION_SOURCE_SETTINGS);
									
									startActivity(i);
								}
								
							})
					.setNegativeButton("不啟用", null).create().show();
		}
		
		Button btn = (Button) findViewById(R.id.btn);
		btn.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				// 取得經緯度座標
				float latitude = (float) currentLocation.getLatitude();
				float longitude = (float) currentLocation.getLongitude();

				// 建立URI字串
				String uri = String.format("geo:%f,%f?z=18", latitude, longitude);
				
				// 建立Intent物件
				Intent geoMap = new Intent(Intent.ACTION_VIEW, Uri.parse(uri));
				
				startActivity(geoMap); // 啟動活動
			}
		});
	}

	@Override
	protected void onResume() {
		super.onResume();
		
		// 取得最佳的定位提供者
		Criteria criteria = new Criteria();
		best = manager.getBestProvider(criteria, true);
		
		// 更新位置頻率的條件
		int minTime = 5000; // 毫秒
		float minDistance = 5; // 公尺
		
		if (best != null) { // 取得快取的最後位置, 如果有的話
			currentLocation = manager.getLastKnownLocation(best);
			manager.requestLocationUpdates(best, minTime, minDistance, listener);
		} else { // 取得快取的最後位置,如果有的話
			currentLocation = manager.getLastKnownLocation(LocationManager.GPS_PROVIDER);
			manager.requestLocationUpdates(LocationManager.GPS_PROVIDER,minTime, minDistance, listener);
		}
		updatePosition(); // 更新位置
	}
    
	@Override
	protected void onPause() {
		super.onPause();
		manager.removeUpdates(listener);
	}

	// 更新現在的位置
	private void updatePosition() {
		TextView output = (TextView) findViewById(R.id.output);

		if (currentLocation == null) {
			output.setText("取得定位資訊中...");
		} else {
			output.setText(getLocationInfo(currentLocation));
		}
	}

	// 建立定位服務的傾聽者物件
	private LocationListener listener = new LocationListener() {

		@Override
		public void onLocationChanged(Location location) {
			currentLocation = location;
			updatePosition();
		}

		@Override
		public void onProviderDisabled(String provider) {
		}

		@Override
		public void onProviderEnabled(String provider) {
		}

		@Override
		public void onStatusChanged(String provider, int status, Bundle extras) {
		}
	};

	// 取得定位資訊
	private String getLocationInfo(Location location) {
		StringBuffer str = new StringBuffer();
		str.append("定位提供者(Provider): " + location.getProvider());
		str.append("\n緯度(Latitude): " + Double.toString(location.getLatitude()));
		str.append("\n經度(Longitude): " + Double.toString(location.getLongitude()));
		str.append("\n高度(Altitude): " + Double.toString(location.getAltitude()));
		return str.toString();
	}
	
}
