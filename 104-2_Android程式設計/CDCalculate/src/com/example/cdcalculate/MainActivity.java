package com.example.cdcalculate;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends Activity {
	
	public EditText input_lend;
	public EditText input_rate;
	public EditText input_number;
	public TextView amount;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.main);
		
		input_lend = (EditText) findViewById(R.id.input_lend);
		input_rate = (EditText) findViewById(R.id.input_rate);
		input_number = (EditText) findViewById(R.id.input_number);
		amount = (TextView) findViewById(R.id.amount);
	}
	
	public void calculate_Click(View view) {
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
		double rate = Double.parseDouble(input_rate.getText().toString());
		int number = Integer.parseInt(input_number.getText().toString());
		
		int result = (int) (lend * Math.pow((rate / 12) / 100 + 1, number));
		
		amount.setText("本利和為：" + result);
	}
	
}
