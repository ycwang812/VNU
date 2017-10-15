using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace CheckID
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        // 在txtId文字方塊按下鍵盤再放開時執行
        private void txtId_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (txtId.Text == "")
            {
                // 取得身份證號碼第1個字是英文字母，並將小寫字母轉成大寫字母
                string str = Convert.ToString(e.KeyChar).ToUpper();

                if (str.CompareTo("A") < 0 || str.CompareTo("Z") > 0)
                {
                    e.Handled = true;
                }
            }
            else
            {
                // 身份證第2~10個字只能輸入0~9或退位鍵
                if ((e.KeyChar.CompareTo('0') < 0 || e.KeyChar.CompareTo('9') > 0) && e.KeyChar != '\b')
                {
                    e.Handled = true;
                }
            }
        }

        // 按 [檢查] 鈕時執行
        private void btnCheck_Click(object sender, EventArgs e)
        {
            // 身份證字數不是10位,不合法
            if (txtId.Text.Length != 10)
            {
                labMsg.Text = "身份證號碼不合法!!";
                labMsg.ForeColor = Color.Red;
                return;  // 離開此事件處理函式
            }

            // 將身份證號碼第一個英文字母轉換成對應的數值
            int[] head = new int[] { 
                10, 11, 12, 13, 14, 15, 16, 17, 34, 18, 
                19, 20, 21, 22, 35, 23, 24, 25, 26, 27, 
                28, 29, 30, 41, 42, 33 };
            int id_head;
            id_head = head[Convert.ToChar(txtId.Text.Substring(0, 1).ToUpper()) - ('A')];
            
            // 組合轉換過的身份證號碼id
            string id = id_head + txtId.Text.Substring(1, 9);

            //使用公式計算身份證號碼是否合法
            int n = 
                Convert.ToInt32(id.Substring(0, 1)) +
                Convert.ToInt32(id.Substring(1, 1)) * 9 +
                Convert.ToInt32(id.Substring(2, 1)) * 8 +
                Convert.ToInt32(id.Substring(3, 1)) * 7 +
                Convert.ToInt32(id.Substring(4, 1)) * 6 +
                Convert.ToInt32(id.Substring(5, 1)) * 5 +
                Convert.ToInt32(id.Substring(6, 1)) * 4 +
                Convert.ToInt32(id.Substring(7, 1)) * 3 +
                Convert.ToInt32(id.Substring(8, 1)) * 2 +
                Convert.ToInt32(id.Substring(9, 1)) +
                Convert.ToInt32(id.Substring(10, 1));

            // 判斷身份證是否合法
            if ((n % 10) == 0)
            {
                labMsg.Text = "身份證號碼合法!!";
                labMsg.ForeColor = Color.Blue;
            }
            else
            {
                labMsg.Text = "身份證號碼不合法!!";
                labMsg.ForeColor = Color.Red;
            }
        }
    }
}

