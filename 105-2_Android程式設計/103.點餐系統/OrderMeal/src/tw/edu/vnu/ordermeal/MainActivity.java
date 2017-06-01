package tw.edu.vnu.ordermeal;

import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.TextView;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.DialogInterface.OnMultiChoiceClickListener;

public class MainActivity extends Activity {

	private Button submit;
	private TextView respond;
	private String[] s1 = { "美味蟹堡", "義式香腸堡", "蔬菜水果堡", "香蕉潛艇堡", "香烤雞肉堡" };
	private boolean[] checkedItems = new boolean[s1.length];
	private boolean[] backupcheckedItems = new boolean[s1.length];
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		
		submit = (Button) findViewById(R.id.submit);
		respond = (TextView) findViewById(R.id.respond);
		
		submit.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View view) {
				new AlertDialog.Builder(MainActivity.this)
						.setTitle(getResources().getString(R.string.respond))
						.setMultiChoiceItems(s1, checkedItems, new OnMultiChoiceClickListener() {
							
							@Override
							public void onClick(DialogInterface dialog, int which, boolean isChecked) {
								if (isChecked) {
									checkedItems[which] = true;
								}
							}
						})
						.setPositiveButton(getResources().getString(R.string.sure), new DialogInterface.OnClickListener() {
							
							@Override
							public void onClick(DialogInterface dialog, int which) {
								backupcheckedItems = checkedItems.clone();
								
								StringBuilder sb = new StringBuilder();
								sb.append(getResources().getString(R.string.respond)).append("\n");
								
								for (int i = 0; i < checkedItems.length; i++) {
									if (checkedItems[i]) {
										sb.append(s1[i]).append("\n");
									}
								}
								
								respond.setText(sb.toString());
							}
						})
						.setNegativeButton(getResources().getString(R.string.exit), new DialogInterface.OnClickListener() {
							
							@Override
							public void onClick(DialogInterface arg0, int arg1) {
								checkedItems = backupcheckedItems.clone();
							}
						})
						.show();
			}
		});
	}

}
