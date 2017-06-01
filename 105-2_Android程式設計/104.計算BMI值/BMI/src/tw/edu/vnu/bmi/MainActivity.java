package tw.edu.vnu.bmi;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.Toast;

public class MainActivity extends Activity {
	
	private RadioButton male;
	private RadioButton female;
	private EditText height;
	private EditText weight;
	private Button submit;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        
        male = (RadioButton) findViewById(R.id.male);
        female = (RadioButton) findViewById(R.id.female);
        height = (EditText) findViewById(R.id.height);
        weight = (EditText) findViewById(R.id.weight);
        submit = (Button) findViewById(R.id.submit);
        
        submit.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View arg0) {
				String sex = "";
				
				if (male.isChecked()) {
					sex = "m";
				} else if (female.isChecked()) {
					sex = "f";
				} else { // 未選擇性別錯誤處理
					Toast.makeText(MainActivity.this, getResources().getString(R.string.err_msg_sex), Toast.LENGTH_SHORT).show();
					return;
				}
				
				// 檢查畫面欄位有無輸入值
				if (height.getText().toString().isEmpty()) {
					Toast.makeText(MainActivity.this, getResources().getString(R.string.err_msg_height), Toast.LENGTH_SHORT).show();
					return;
				}
				if (weight.getText().toString().isEmpty()) {
					Toast.makeText(MainActivity.this, getResources().getString(R.string.err_msg_height), Toast.LENGTH_SHORT).show();
					return;
				}
				
				double h = Double.parseDouble(height.getText().toString());
				double w = Double.parseDouble(weight.getText().toString());
				
				Bundle bundle = new Bundle();
				bundle.putString("sex", sex);
				bundle.putDouble("height", h);
				bundle.putDouble("weight", w);
				
				Intent intent = new Intent(MainActivity.this, ChildActivity.class);
				intent.putExtras(bundle);
				
				startActivityForResult(intent, 0);
			}
		});
    }

	@Override
	protected void onActivityResult(int requestCode, int resultCode, Intent data) {
		switch (resultCode) {
			case RESULT_OK:
				Bundle bundle = data.getExtras();
				
				String sex = bundle.getString("Sex");
				double h = bundle.getDouble("height");
				double w = bundle.getDouble("weight");

				height.setText(String.valueOf(h));
				weight.setText(String.valueOf(w));

				if(sex.equals("m")) {
					male.setChecked(true);
				} else {
					female.setChecked(true);
				}
				
				break;
			default:
				break;
		} 
	}
    
}
