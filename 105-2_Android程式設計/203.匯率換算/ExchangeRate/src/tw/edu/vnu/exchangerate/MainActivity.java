package tw.edu.vnu.exchangerate;

import android.app.Activity;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

public class MainActivity extends Activity {
	
	public static final String PREF_ExchangeRate = "Exchange_Rate";
	private EditText rate;
	private EditText ntd;
	private Button calc_btn;
	private TextView respond;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        
        rate = (EditText) findViewById(R.id.rate);
        ntd = (EditText) findViewById(R.id.ntd);
        calc_btn = (Button) findViewById(R.id.calc_btn);
        respond = (TextView) findViewById(R.id.respond);
        
        SharedPreferences settings = getSharedPreferences(PREF_ExchangeRate, 0);
        rate.setText(settings.getString(PREF_ExchangeRate, ""));
        
        calc_btn.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View view) {
				double r = Double.parseDouble(rate.getText().toString());
				double d = Double.parseDouble(ntd.getText().toString());

				respond.setText(R.string.usd_result + String.format("%.2f", r / d));
			}
		});
    }

	@Override
	protected void onStop() {
		super.onStop();
		
		SharedPreferences settings = getSharedPreferences(PREF_ExchangeRate, 0);
		settings.edit()
				.putString(PREF_ExchangeRate, rate.getText().toString())
				.commit();
	}
    
}
