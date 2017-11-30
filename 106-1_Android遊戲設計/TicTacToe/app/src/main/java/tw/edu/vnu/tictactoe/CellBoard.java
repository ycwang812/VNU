package tw.edu.vnu.tictactoe;

import android.graphics.RectF;

/**
 * Created by csie on 2017/11/23.
 */

public class CellBoard {

    private int w;
    private int h;
    protected Cell[] position;

    public CellBoard(int cellWidth, int cellHeight) {
        w = cellWidth;
        h = cellHeight;
        initialBoardCells();
    }

    private class Cell extends RectF {

        private boolean filled;

        public Cell(float left, float top, float right, float bottom) {
            super(left, top, right, bottom);
            filled = false;
        }

        public boolean isFilled() {
            return filled;
        }

        public void setFilled(boolean filled) {
            this.filled = filled;
        }

    }

    private void initialBoardCells() {
        int offset = 15;
        position = new Cell[9];

        position[0] = new Cell(0 + offset, 0 + offset, w - offset, h - offset);
        position[1] = new Cell(w + offset, 0 + offset, 2 * w -offset, h - offset);
        position[2] = new Cell(2 * w + offset, 0 + offset, 3 * w - offset, h - offset);

        position[3] = new Cell(0 + offset, h + offset, w - offset, 2 * h - offset);
        position[4] = new Cell(w + offset, h + offset, 2 * w - offset, 2 * h - offset);
        position[5] = new Cell(2 * w + offset, h + offset, 3 * w - offset, 2 * h - offset);

        position[6] = new Cell(0 + offset, 2 * h + offset, w - offset, 3 * h - offset);
        position[7] = new Cell(w + offset, 2 * h + offset, 2 * w - offset, 3 * h - offset);
        position[8] = new Cell(2 * w + offset, 2 * h + offset, 3 * w - offset, 3 * h - offset);
    }

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
