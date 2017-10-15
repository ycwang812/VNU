using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace Poker
{
    public partial class Form1 : Form
    {
        int num1, num2; // num1為我方的數值、num2為電腦的數值

        public Form1()
        {
            InitializeComponent();
        }

        // 表單載入時執行
        private void Form1_Load(object sender, EventArgs e)
        {
            pic1.Enabled = false;
            pic2.Enabled = false;
            pic1.SizeMode = PictureBoxSizeMode.StretchImage;
            pic2.SizeMode = PictureBoxSizeMode.StretchImage;
            pic1.Image = new Bitmap("Pokerbk.jpg");
            pic2.Image = new Bitmap("Pokerbk.jpg");
            labMsg.Text = "請按洗牌鈕遊戲開始...";
        }

        // 按洗牌鈕執行
        private void btnOK_Click(object sender, EventArgs e)
        {
            pic1.Enabled = true;
            pic2.Enabled = true;
            btnOK.Enabled = false;
            pic1.Image = new Bitmap("Pokerbk.jpg");
            pic2.Image = new Bitmap("Pokerbk.jpg");
            Random r = new Random();
            num1 = r.Next(2, 15); // 給第一張牌產生2~14的正整數
            num2 = r.Next(2, 15); // 給第二張牌產生2~14的正整數
            labMsg.Text = "請在撲克牌上按一下選取...";
        }

        // 按pic1執行該圖片方塊的Click事件處理函式
        private void pic1_Click(object sender, EventArgs e)
        {
            pic1.Image = new Bitmap("Poker" + Convert.ToString(num1) + ".jpg");
            pic2.Image = new Bitmap("Poker" + Convert.ToString(num2) + ".jpg");

            if (num1 > num2)
            {
                labMsg.Text = "你贏了！按洗牌鈕重玩...";
            }
            else
            {
                if (num1 == num2)
                {
                    labMsg.Text = "平手！按洗牌鈕重玩...";
                }
                else
                {
                    labMsg.Text = "你輸了！按洗牌鈕重玩...";
                }
            }

            pic1.Enabled = false;
            pic2.Enabled = false;
            btnOK.Enabled = true;
        }

        // 按pic2執行該圖片方塊的Click事件處理函式
        private void pic2_Click(object sender, EventArgs e)
        {
            pic1.Image = new Bitmap("Poker" + Convert.ToString(num1) + ".jpg");
            pic2.Image = new Bitmap("Poker" + Convert.ToString(num2) + ".jpg");

            if (num2 > num1)
            {
                labMsg.Text = "你贏了！按洗牌鈕重玩...";
            }
            else
            {
                if (num2 == num1)
                {
                    labMsg.Text = "平手！按洗牌鈕重玩...";
                }
                else
                {
                    labMsg.Text = "你輸了！按洗牌鈕重玩...";
                }
            }

            pic1.Enabled = false;
            pic2.Enabled = false;
            btnOK.Enabled = true;
        }

        // 按結束鈕執行
        private void btnEnd_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
    }
}
