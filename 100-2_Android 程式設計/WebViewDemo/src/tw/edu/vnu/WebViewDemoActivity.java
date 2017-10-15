package tw.edu.vnu;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.view.KeyEvent;
import android.view.View;
import android.webkit.WebChromeClient;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.EditText;

public class WebViewDemoActivity extends Activity {
	
	private WebView web;
	private ProgressDialog progressDialog;
	private Handler handler;
	private EditText txtUrl;
	
    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);
        
        web = (WebView) findViewById(R.id.webView1);
        initWebBrowser(); // 初始化WebView
        // 取得EditText元件
        txtUrl = (EditText) findViewById(R.id.txtUrl);
        String strUrl = txtUrl.getText().toString();
        // 預設網址為http://www.google.com
        loadUrl(web, strUrl);
    }
    
    public void initWebBrowser() {
    	web.getSettings().setJavaScriptEnabled(true); // 啟用JavaScript
    	web.setScrollBarStyle(0); // 顯示捲動軸
    	// 覆寫方法讓使用者點選網頁連結時，直接載入新網頁
    	web.setWebViewClient(new WebViewClient() {
			@Override
			public boolean shouldOverrideUrlLoading(WebView view, String url) {
				loadUrl(view, url);
				return true;
			}
    	});
    	// 覆寫方法以便在完全載入網頁後，送出Handler物件的訊息關閉進度對話方塊
    	web.setWebChromeClient(new WebChromeClient() {
			@Override
			public void onProgressChanged(WebView view, int progress) {
				if (progress == 100) { // 全部載入
					handler.sendEmptyMessage(1); // 隱藏進度對話方塊
				}
				super.onProgressChanged(view, progress);
			}
    	});
    	
    	progressDialog = new ProgressDialog(this); // 建立進度對話方塊
    	progressDialog.setProgressStyle(ProgressDialog.STYLE_SPINNER);
    	progressDialog.setMessage("載入網頁中...");
    }
    
    // 在WebView載入網頁
    public void loadUrl(final WebView view, final String url) {
    	new Thread() {
			@Override
			public void run() {
				handler.sendEmptyMessage(0); // 顯示進度對話方塊
				view.loadUrl(url); // 載入網頁
			}
    	}.start();
    	// 覆寫方法來處理訊息，使用switch條件敘述判斷參數，以便顯示或隱藏進度對話方塊
    	handler = new Handler() {
			@Override
			public void handleMessage(Message msg) {
				if (!Thread.currentThread().isInterrupted()) {
					switch (msg.what) {
					case 0:
						progressDialog.show(); // 顯示進度對話方塊
						break;
					case 1:
						progressDialog.hide(); // 隱藏進度對話方塊
						break;
					}
				}
				super.handleMessage(msg);
			}
    	};
    }
    
    // Button元件的事件處理
    public void btn1_Click(View view) {
    	String strUrl = txtUrl.getText().toString();
    	loadUrl(web, strUrl);
    }

    // 處理使用者按下返回鍵回到上一頁，如果沒有上一頁就顯示對話方塊，確認是否離開行動瀏覽器
	@Override
	public boolean onKeyDown(int keyCode, KeyEvent event) {
		if (keyCode == KeyEvent.KEYCODE_BACK && web.canGoBack()) {
			web.goBack(); // 上一頁網頁
			return true;
		} else if (keyCode == KeyEvent.KEYCODE_BACK) {
			// 顯示確認離開的對話方塊
			AlertDialog.Builder aDlg = new AlertDialog.Builder(this);
			aDlg.setTitle("離開行動瀏覽器")
				.setMessage("請確認離開行動瀏覽器？").setPositiveButton("是", new OnClickListener() {
					@Override
					public void onClick(DialogInterface dialog, int which) {
						WebViewDemoActivity.this.finish();
					}
				}).setNegativeButton("否", null).show();
			return true;
		}
		return super.onKeyDown(keyCode, event);
	}
    
}
