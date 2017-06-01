package tw.edu.vnu.dynamicpwd;

import android.app.Activity;
import android.os.Bundle;
import android.text.method.HideReturnsTransformationMethod;
import android.text.method.PasswordTransformationMethod;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.CheckBox;
import android.widget.EditText;

public class MainActivity extends Activity {

	private EditText pwd;
	private CheckBox cb;
	
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        
        pwd = (EditText) findViewById(R.id.mPassword);
        cb = (CheckBox) findViewById(R.id.mCheck);
        cb.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View view) {
				if(cb.isChecked()) {
					pwd.setTransformationMethod(HideReturnsTransformationMethod.getInstance());
				} else {
					pwd.setTransformationMethod(PasswordTransformationMethod.getInstance());
				}
			}
		});
    }
}
