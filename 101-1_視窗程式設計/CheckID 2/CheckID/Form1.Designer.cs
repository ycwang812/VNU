namespace CheckID
{
    partial class Form1
    {
        /// <summary>
        /// 設計工具所需的變數。
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// 清除任何使用中的資源。
        /// </summary>
        /// <param name="disposing">如果應該處置 Managed 資源則為 true，否則為 false。</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form 設計工具產生的程式碼

        /// <summary>
        /// 此為設計工具支援所需的方法 - 請勿使用程式碼編輯器修改這個方法的內容。
        ///
        /// </summary>
        private void InitializeComponent()
        {
            this.labMsg = new System.Windows.Forms.Label();
            this.btnCheck = new System.Windows.Forms.Button();
            this.Label1 = new System.Windows.Forms.Label();
            this.txtId = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // labMsg
            // 
            this.labMsg.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.labMsg.Font = new System.Drawing.Font("新細明體", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(136)));
            this.labMsg.Location = new System.Drawing.Point(55, 74);
            this.labMsg.Name = "labMsg";
            this.labMsg.Size = new System.Drawing.Size(225, 33);
            this.labMsg.TabIndex = 19;
            this.labMsg.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // btnCheck
            // 
            this.btnCheck.Location = new System.Drawing.Point(238, 27);
            this.btnCheck.Name = "btnCheck";
            this.btnCheck.Size = new System.Drawing.Size(75, 24);
            this.btnCheck.TabIndex = 18;
            this.btnCheck.Text = "檢查";
            this.btnCheck.Click += new System.EventHandler(this.btnCheck_Click);
            // 
            // Label1
            // 
            this.Label1.BackColor = System.Drawing.Color.Transparent;
            this.Label1.Font = new System.Drawing.Font("新細明體", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(136)));
            this.Label1.Location = new System.Drawing.Point(14, 27);
            this.Label1.Name = "Label1";
            this.Label1.Size = new System.Drawing.Size(106, 23);
            this.Label1.TabIndex = 17;
            this.Label1.Text = "身份證號碼：";
            this.Label1.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.Label1.Click += new System.EventHandler(this.Label1_Click);
            // 
            // txtId
            // 
            this.txtId.Location = new System.Drawing.Point(126, 27);
            this.txtId.MaxLength = 10;
            this.txtId.Name = "txtId";
            this.txtId.Size = new System.Drawing.Size(100, 22);
            this.txtId.TabIndex = 16;
            this.txtId.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtId_KeyPress);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(342, 129);
            this.Controls.Add(this.labMsg);
            this.Controls.Add(this.btnCheck);
            this.Controls.Add(this.Label1);
            this.Controls.Add(this.txtId);
            this.Name = "Form1";
            this.Text = "身份證驗證程式";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        internal System.Windows.Forms.Label labMsg;
        internal System.Windows.Forms.Button btnCheck;
        internal System.Windows.Forms.Label Label1;
        internal System.Windows.Forms.TextBox txtId;
    }
}

