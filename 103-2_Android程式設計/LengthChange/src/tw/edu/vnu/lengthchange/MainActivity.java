package tw.edu.vnu.lengthchange;

import java.math.BigDecimal;

import android.app.Activity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;

public class MainActivity extends Activity {
	
	private EditText inputValue;
	private TextView result;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		
		inputValue = (EditText) findViewById(R.id.input_value);
		result = (TextView) findViewById(R.id.result);
	}
	
	public void changeFoot_Click(View view) {
		this.changeLength(true);
	}
	
	public void changeMeter_Click(View view) {
		this.changeLength(false);
	}
	
	private void changeLength(boolean isMeter) {
		String s = inputValue.getText().toString().trim();
		
		if (s.length() == 0) {
			result.setText(this.getString(R.string.error));
			return;
		}
		
		BigDecimal num1 = new BigDecimal(s);
		BigDecimal num2 = num1.multiply(new BigDecimal(isMeter ? "3.28" : "0.3048"));
		
		double d1 = num1.setScale(1, BigDecimal.ROUND_HALF_DOWN).doubleValue();
		double d2 = num2.setScale(2, BigDecimal.ROUND_HALF_DOWN).doubleValue();
		
		result.setText(d1 + (isMeter ? " 公尺=" : " 英呎=") + d2 + (isMeter ? " 英呎" : " 公尺"));
	}

	private void rest() {
		inputValue.setText("");
		result.setText("");
	}
	
	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		MenuInflater inflater = getMenuInflater();
	    inflater.inflate(R.menu.menu, menu);
	    return true;
	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		switch (item.getItemId()) {
			case R.id.rest:
				rest();
				return true;
			default:
				return super.onOptionsItemSelected(item);
		}
	}

}
