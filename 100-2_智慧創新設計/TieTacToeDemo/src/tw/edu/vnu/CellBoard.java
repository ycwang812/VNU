package tw.edu.vnu;

import android.graphics.RectF;

public class CellBoard {

	private int w;
	private int h;
	protected Cell[] position;
	
	// 建構子
	public CellBoard(int cellWidth, int cellHeight) {
		w = cellWidth;
		h = cellHeight;
		initialBoardCells();
	}
	
	// 宣告儲存格類別
	private class Cell extends RectF {
		private boolean filled;
		
		// 建構子
		public Cell(float left, float top, float right, float bottom) {
			super(left, top, right, bottom);
			filled = false;
		}
		
		// 指定已填入圖形
		public void setFilled(boolean filled) {
			this.filled = filled;
		}
		
		// 檢查是否已填入圖形
		public boolean isFilled() {
			return filled;
		}
	}
	
	// 計算儲存格陣列各儲存格的座標
	private void initialBoardCells() {
		int offset = 15; // 位移量
		position = new Cell[9];
		
		// 第一欄
		position[0] = new Cell(0 + offset, 0 + offset, w - offset, h - offset);
    	position[1] = new Cell(w + offset, 0 + offset, 2 * w - offset, h - offset);
    	position[2] = new Cell(2 * w + offset, 0 + offset, 3 * w - offset, h - offset);
    	// 第二欄
    	position[3] = new Cell(0 + offset, h + offset, w - offset, 2 * h - offset);
    	position[4] = new Cell(w + offset, h + offset, 2 * w - offset, 2 * h - offset);
    	position[5] = new Cell(2 * w + offset, h + offset, 3 * w - offset, 2 * h - offset);
    	// 第三欄
    	position[6] = new Cell(0 + offset, 2 * h + offset, w - offset, 3 * h - offset);
    	position[7] = new Cell(w + offset, 2 * h + offset, 2 * w - offset, 3 * h - offset);
    	position[8] = new Cell(2 * w + offset, 2 * h + offset, 3 * w - offset, 3 * h - offset);		
	}
	
	// 取得填入的Cell物件
	public RectF getCellToFill(float x, float y) {
		for (Cell bp : position) {
			
			if (bp.contains(x, y) && !bp.isFilled()) {
				RectF retCell = new RectF(bp);
				bp.setFilled(true);
				return retCell;
			}
		}
		
		return null;
	}
	
}
