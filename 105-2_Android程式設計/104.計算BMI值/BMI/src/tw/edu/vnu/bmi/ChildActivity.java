package tw.edu.vnu.bmi;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.TextView;

public class ChildActivity extends Activity {
	
	private Intent intent;
	private TextView respond;
	private TextView msg;
	private Button back;

	@Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_child);
        
        respond = (TextView) findViewById(R.id.respond);
        msg = (TextView) findViewById(R.id.msg);
        back = (Button) findViewById(R.id.back);
        
        intent = getIntent();
        Bundle bundle = intent.getExtras();
        String sex = bundle.getString("sex");
        double height = bundle.getDouble("height");
        double weight = bundle.getDouble("weight");
        
        respond.setText(getBMI(height, weight));
        msg.setText(getAdvice(sex, height, weight));
        
        back.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View arg0) {
				setResult(RESULT_OK, intent);
				finish();
			}
		});
    }
	
	private String format(double num) {
		return String.format("%.2f", num);
	}
	
	private String getBMI(double height, double weight) {
		return getResources().getString(R.string.result) + format(weight / (height * height));
	}
	
	private String getAdvice(String sex, double height, double weight) {
		double max = sex.equals("m") ? 25 : 22;
		double min = sex.equals("m") ? 22 : 18;
		double bmi = weight / (height * height);
		
		if (bmi > max) {
			return getResources().getString(R.string.bmi_heavy);
		} else if (bmi < min) {
			return getResources().getString(R.string.bmi_light);
		} else {
			return getResources().getString(R.string.bmi_average);
		}
	}
	
}
