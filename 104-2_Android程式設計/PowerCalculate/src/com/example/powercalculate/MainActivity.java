package com.example.powercalculate;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends Activity {
	
	private Spinner input_v;
	private EditText input_a;
	private EditText input_hr;
	private EditText input_m;
	private Button submit;
	private TextView respond;
	
//	private String[] option_vs = { "110V", "220V" };

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		
		input_v = (Spinner) findViewById(R.id.input_v);
		input_a = (EditText) findViewById(R.id.input_a);
		input_hr = (EditText) findViewById(R.id.input_hr);
		input_m = (EditText) findViewById(R.id.input_m);
		submit = (Button) findViewById(R.id.submit);
		respond = (TextView) findViewById(R.id.respond);
		
//		option_vs = getResources().getStringArray(R.array.option_vs);
		
//		ArrayAdapter<String> adapter = new ArrayAdapter<String>(this, android.R.layout.simple_spinner_item, option_vs);
//		input_v.setAdapter(adapter);
		
//		input_v.setOnItemSelectedListener(new OnItemSelectedListener() {
//
//			@Override
//			public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
//				int index = parent.getSelectedItemPosition();
//				Toast.makeText(MainActivity.this,"選擇電壓: " + option_vs[index], Toast.LENGTH_SHORT).show();
//				
//				Toast.makeText(MainActivity.this,"選擇電壓: " + input_v.getSelectedItem().toString(), Toast.LENGTH_SHORT).show();
//			}
//
//			@Override
//			public void onNothingSelected(AdapterView<?> parent) {
//			}
//		});
		
		submit.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View view) {
				if (input_v.getSelectedItem().toString().isEmpty()) {
					Toast.makeText(MainActivity.this, getResources().getString(R.string.error_v), Toast.LENGTH_SHORT).show();
					return;
				}
				if (input_a.getText().toString().isEmpty()) {
					Toast.makeText(MainActivity.this, getResources().getString(R.string.error_a), Toast.LENGTH_SHORT).show();
					return;
				}
				if (input_hr.getText().toString().isEmpty()) {
					Toast.makeText(MainActivity.this, getResources().getString(R.string.error_hr), Toast.LENGTH_SHORT).show();
					return;
				}
				if (input_m.getText().toString().isEmpty()) {
					Toast.makeText(MainActivity.this, getResources().getString(R.string.error_m), Toast.LENGTH_SHORT).show();
					return;
				}
				
				int v = input_v.getSelectedItem().toString().equals("110V") ? 110 : 220;
				double a = Double.parseDouble(input_a.getText().toString());
				int hr = Integer.parseInt(input_hr.getText().toString());
				int m = Integer.parseInt(input_m.getText().toString());
				
				int result = (int) (((v * a) / 1000) * (hr * 30) * m);
				
				respond.setText("$" + result);
			}
		});
	}
	
}
