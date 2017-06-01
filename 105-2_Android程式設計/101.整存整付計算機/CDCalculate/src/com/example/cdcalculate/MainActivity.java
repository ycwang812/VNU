package com.example.cdcalculate;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends Activity {
	
	public EditText input_lend; // 本金
	public EditText input_rate; // 年利率
	public EditText input_number; // 存款期數
	public TextView amount; // 本利和

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.main);
		
		// 取得畫面元件
		input_lend = (EditText) findViewById(R.id.input_lend);
		input_rate = (EditText) findViewById(R.id.input_rate);
		input_number = (EditText) findViewById(R.id.input_number);
		amount = (TextView) findViewById(R.id.amount);
	}
	
	public void calculate_Click(View view) {

		// 檢查畫面欄位有無輸入值
		if (input_lend.getText().toString().isEmpty()) {
			Toast.makeText(this, "請輸入本金！", Toast.LENGTH_SHORT).show();
			return;
		}
		if (input_rate.getText().toString().isEmpty()) {
			Toast.makeText(this, "請輸入年利率！", Toast.LENGTH_SHORT).show();
			return;
		}
		if (input_number.getText().toString().isEmpty()) {
			Toast.makeText(this, "請輸入存款期數！", Toast.LENGTH_SHORT).show();
			return;
		}
		
		int lend = Integer.parseInt(input_lend.getText().toString());
		// number
		// int rate = Integer.parseDouble(input_rate.getText().toString());
		// numberDecimal
		double rate = Double.parseDouble(input_rate.getText().toString());
		int number = Integer.parseInt(input_number.getText().toString());
		
		// 計算本利和公式
		// 本利和=本金*(1+年利率/12/)%^存款期數
		int result = (int) (lend * Math.pow((rate / 12) / 100 + 1, number));
		
		amount.setText("本利和為：" + result);
	}
	
}
