package com.example.alertdialog;

import java.util.ArrayList;
import java.util.List;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.RadioButton;

public class MainActivity extends Activity {
	
	private EditText nameText;
	private RadioButton rbtn0;
	private RadioButton rbtn1;
	private CheckBox checkBox1;
	private CheckBox checkBox2;
	private CheckBox checkBox3;
	private Button showbtn;
	private AlertDialog.Builder alertDialog;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		
		nameText = (EditText) findViewById(R.id.editText1);
		rbtn0 = (RadioButton) findViewById(R.id.radio0);
		rbtn1 = (RadioButton) findViewById(R.id.radio1);
	     
		checkBox1 = (CheckBox) findViewById(R.id.checkBox1);
		checkBox2 = (CheckBox) findViewById(R.id.checkBox2);
		checkBox3 = (CheckBox) findViewById(R.id.checkBox3);
		
		alertDialog = new AlertDialog.Builder(this);
		alertDialog.setTitle("結果");
		alertDialog.setOnCancelListener(new DialogInterface.OnCancelListener() {
			
			@Override
			public void onCancel(DialogInterface dialog) {
				// 關閉 AlertDialog
			}
		});
	     
		showbtn = (Button) findViewById(R.id.button1);
		showbtn.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				StringBuilder sb = new StringBuilder();
				sb.append("姓名：");
				
				if (nameText.getText().toString().trim().isEmpty()) {
					sb.append("未填").append("\n");
				} else {
					sb.append(nameText.getText().toString()).append("\n");
				}
				
				sb.append("性別：");
				
				if (rbtn0.isChecked()) {
					sb.append("帥哥").append("\n");
				} else {
					sb.append("美女").append("\n");
				}
				
				sb.append("興趣：");
				List<String> list = new ArrayList<String>();
				
				if (checkBox1.isChecked()) {
					list.add("吃飯");
				}
				if (checkBox2.isChecked()) {
					list.add("睡覺");
				}
				if (checkBox3.isChecked()) {
					list.add("上網");
				}
				
				if (list.size() != 0) {
					
					for (int i = 0; i < list.size(); i++) {
						String s = list.get(i);
						sb.append(s);
						
						if (i < list.size() - 1) {
							sb.append(", ");
						}
					}
				} else {
					sb.append("未選擇");
				}
				
				alertDialog.setMessage(sb.toString()).show();
			}
		});
	}
	
}
