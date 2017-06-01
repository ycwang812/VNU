package tw.edu.vnu.gallery;

import android.app.Activity;
import android.content.Context;
import android.content.res.TypedArray;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.BaseAdapter;
import android.widget.Gallery;
import android.widget.ImageView;
import android.widget.Toast;

public class MainActivity extends Activity {
	
	private Gallery gallery;
	private int[] images = { R.drawable.png001, R.drawable.png002, R.drawable.png003,
			R.drawable.png004, R.drawable.png005, R.drawable.png006, R.drawable.png007,
			R.drawable.png008, R.drawable.png009, R.drawable.png010, R.drawable.png011 };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        
        ImageAdapter adapter = new ImageAdapter(this);
        
        gallery = (Gallery) findViewById(R.id.gallery);
        gallery.setAdapter(adapter);
        gallery.setOnItemSelectedListener(new OnItemSelectedListener() {

			@Override
			public void onItemSelected(AdapterView<?> arg0, View arg1, int arg2, long arg3) {
				Toast.makeText(MainActivity.this, getString(R.string.my_gallery_text_pre) + arg2
						+ getString(R.string.my_gallery_text_post), Toast.LENGTH_SHORT).show();
			}

			@Override
			public void onNothingSelected(AdapterView<?> arg0) {
			}
		});
    }
    
    public class ImageAdapter extends BaseAdapter {
    	
    	private Context context;
    	private int itemBackground;
    	
    	public ImageAdapter(Context c) {
    		context = c;
    		TypedArray typedArray = obtainStyledAttributes(R.styleable.Gallery);
    		itemBackground = typedArray.getResourceId(R.styleable.Gallery_android_galleryItemBackground, 0);
    	}

		@Override
		public int getCount() {
			return images.length;
		}

		@Override
		public Object getItem(int position) {
			return position;
		}

		@Override
		public long getItemId(int position) {
			return position;
		}

		@Override
		public View getView(int position, View convertView, ViewGroup parent) {
			ImageView imageView = new ImageView(context);
			imageView.setImageResource(images[position]);
            imageView.setLayoutParams(new Gallery.LayoutParams(236, 188));
            imageView.setScaleType(ImageView.ScaleType.FIT_XY);
            imageView.setBackgroundResource(itemBackground);
            return imageView;
		}
    	
    }  
    
}
