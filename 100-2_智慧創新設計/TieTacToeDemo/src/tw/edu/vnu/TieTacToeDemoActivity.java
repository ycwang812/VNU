package tw.edu.vnu;

import android.app.Activity;
import android.os.Bundle;

public class TieTacToeDemoActivity extends Activity {
	
    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(new MainBoard(this));
    }
    
}
