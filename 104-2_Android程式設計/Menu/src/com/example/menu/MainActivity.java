package com.example.menu;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;

public class MainActivity extends Activity {

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		menu.add(0, Menu.FIRST, 0, R.string.menu_create);
		menu.add(0, Menu.FIRST + 1, 1, R.string.menu_create);
		menu.add(0, Menu.FIRST + 2, 2, R.string.menu_create);
		menu.add(0, Menu.FIRST + 3, 3, R.string.menu_create);
		
		return true;
	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		switch (item.getItemId()) {
			case Menu.FIRST:
				setTitle(getString(R.string.menu_create));
				break;
			case Menu.FIRST + 1:
				setTitle(getString(R.string.menu_delete));
				break;
			case Menu.FIRST + 2:
				setTitle(getString(R.string.menu_about));
				openAboutDialog();
				break;
			case Menu.FIRST + 3:
				openExitDialog();
				break;
		}
		
		return super.onOptionsItemSelected(item);
	}

	private void openAboutDialog() {
		new AlertDialog.Builder(this)
		.setTitle(R.string.menu_about)
		.setMessage(R.string.about_msg)
		.setPositiveButton(R.string.btn_ok, null)
		.show();
	}

	private void openExitDialog() {
		new AlertDialog.Builder(this)
		.setTitle(R.string.menu_exit)
		.setMessage(R.string.exit_msg)
		.setNegativeButton(R.string.btn_cancel, null)
		.setPositiveButton(R.string.btn_ok, new OnClickListener() {
			
			@Override
			public void onClick(DialogInterface dialog, int which) {
				finish();
			}
		})
		.show();
	}
	
}
