package tw.edu.vnu;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Point;
import android.graphics.RectF;
import android.view.MotionEvent;
import android.view.View;

public class MainBoard extends View {
	
	private int h, w;
	private Bitmap bitmap;
	private Canvas buffer;
	private Paint paint;
	private boolean isDrawX;
	private Point[] hLine01, hLine02, vLine01, vLine02;
	private CellBoard cellBoard;

	// 建構子
	public MainBoard(Context context) {
		super(context);
		
		paint = new Paint();
		paint.setColor(Color.WHITE);
		paint.setStyle(Paint.Style.STROKE);
		isDrawX = true;
	}

	@Override
	protected void onDraw(Canvas canvas) {
		// 繪出Bitmap物件
		canvas.drawBitmap(bitmap, 0, 0, paint);
	}

	@Override
	protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
		// 取得螢幕寬高尺寸
		h = View.MeasureSpec.getSize(heightMeasureSpec);
		w = View.MeasureSpec.getSize(widthMeasureSpec);
		
		setMeasuredDimension(w, h); // 儲存View物件的寬和高
		
		// 建立Bitmap物件
		bitmap = Bitmap.createBitmap(w, h, Bitmap.Config.ARGB_8888);
		buffer = new Canvas(bitmap); // 使用Bitmap建立Canvas物件
		// 計算點的座標
		calculateLinePlacements();
		drawBoard(); // 繪出井字
	}

	private void calculateLinePlacements() {
		int cellH = h / 3;
		int cellW = w / 3;
		
		hLine01 = new Point[] { new Point(0, cellH), new Point(w, cellH) };
		hLine02 = new Point[] { new Point(0, 2 * cellH), new Point(w, 2 * cellH) };
		
		vLine01 = new Point[] { new Point(cellW, 0), new Point(cellW, h) };
		vLine02 = new Point[] { new Point(2 * cellW, 0), new Point(2 * cellW, h) };
		
		// 建立CellBoard物件
		cellBoard = new CellBoard(cellW, cellH);
	}

	@Override
	public boolean onTouchEvent(MotionEvent event) {
		if (event.getAction() == MotionEvent.ACTION_DOWN) {
			// 取得繪圖長方形的RectF
			RectF position = cellBoard.getCellToFill(event.getX(), event.getY());
			
			if (position != null) {
				if (isDrawX) {
					// 畫X
					buffer.drawLine(position.left, position.top, position.right, position.bottom, paint);
					buffer.drawLine(position.right, position.top, position.left, position.bottom, paint);
				} else {
					// 畫X
					buffer.drawOval(position, paint);
				}
				
				isDrawX = !isDrawX;
				invalidate();
			}
		}
		
		return true;
	}
	
	// 繪出遊戲的井字
	private void drawBoard() {
		buffer.drawLine(hLine01[0].x, hLine01[0].y, hLine01[1].x, hLine01[1].y, paint);
		buffer.drawLine(hLine02[0].x, hLine02[0].y, hLine02[1].x, hLine02[1].y, paint);
		buffer.drawLine(vLine01[0].x, vLine01[0].y, vLine01[1].x, vLine01[1].y, paint);
		buffer.drawLine(vLine02[0].x, vLine02[0].y, vLine02[1].x, vLine02[1].y, paint);
		
		invalidate();
	}

}
