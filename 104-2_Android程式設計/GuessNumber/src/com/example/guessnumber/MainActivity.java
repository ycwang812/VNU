package com.example.guessnumber;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;
import tw.edu.vnu.guessnumber.R;

public class MainActivity extends Activity {
	
	private final static int NUMBER_LENGTH = 3;
	
	private EditText inputText;
	private TextView respond;
	
	private List<String> numList;
	private String result;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		
		inputText = (EditText) findViewById(R.id.input_number);
		respond = (TextView) findViewById(R.id.respond);
		
		getRandomNumber();
	}
	
	public void guess_Click(View view) {
		String inputNumber = inputText.getText().toString().trim();
		
		if (inputNumber.length() == 0) {
			showMsg(getString(R.string.error), true);
			return;
		}
		
		List<String> guessNumberList = new ArrayList<String>();
		Set<String> set = new HashSet<String>();
		
		for (int i = 0; i < inputNumber.length(); i++) {
			String s = inputNumber.substring(i, i + 1);
			guessNumberList.add(s);
			set.add(s);
		}
		
		if (set.size() != 3) {
			showMsg(getString(R.string.error), true);
			return;
		}
		
		int a = 0;
		int b = 0;
		
		for (int i = 0; i < guessNumberList.size(); i++) {
			int index = numList.indexOf(guessNumberList.get(i));
			
			if (index == -1) {
				continue;
			} else if (index == i) {
				a++;
			} else {
				b++;
			}
		}
		
		if (a == NUMBER_LENGTH) {
			showMsg("INPUT的數字：" + inputNumber + "，恭喜你！答對囉~答案：" + result, false);
		} else {
			showMsg("INPUT的數字：" + inputNumber + "=" + a + "A" + b + "B", true);
		}
	}
	
	private void showMsg(String msg, boolean isClear) {
		respond.setText(msg);
		
		if (isClear) {
			inputText.setTag("");
		}
	}
	
	private void getRandomNumber() {
		List<String> list = new ArrayList<String>();
		
		for (int i = 0; i < 10; i++) {
			list.add(String.valueOf(i));
		}
		
		while (numList.size() < NUMBER_LENGTH) {
			int index = (int) (Math.random() * 10);
			
			if (index >= numList.size()) {
				continue;
			}
			
			numList.add(list.get(index));
			result += list.get(index);
			list.remove(index);
		}
		
	}
	
}
