
namespace CapaPresentacion
{
    partial class FormLogin
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.label1 = new System.Windows.Forms.Label();
            this.txtUsuario = new System.Windows.Forms.TextBox();
            this.txtClave = new System.Windows.Forms.TextBox();
            this.labelUsuario = new System.Windows.Forms.Label();
            this.labelClave = new System.Windows.Forms.Label();
            this.btnIniciarSesion = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.label1.Location = new System.Drawing.Point(354, 106);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(90, 19);
            this.label1.TabIndex = 0;
            this.label1.Text = "Iniciar Sesion";
            // 
            // txtUsuario
            // 
            this.txtUsuario.Location = new System.Drawing.Point(274, 157);
            this.txtUsuario.Name = "txtUsuario";
            this.txtUsuario.Size = new System.Drawing.Size(255, 23);
            this.txtUsuario.TabIndex = 1;
            // 
            // txtClave
            // 
            this.txtClave.Location = new System.Drawing.Point(274, 219);
            this.txtClave.Name = "txtClave";
            this.txtClave.PasswordChar = '*';
            this.txtClave.Size = new System.Drawing.Size(255, 23);
            this.txtClave.TabIndex = 2;
            // 
            // labelUsuario
            // 
            this.labelUsuario.AutoSize = true;
            this.labelUsuario.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.labelUsuario.Location = new System.Drawing.Point(204, 155);
            this.labelUsuario.Name = "labelUsuario";
            this.labelUsuario.Size = new System.Drawing.Size(56, 19);
            this.labelUsuario.TabIndex = 3;
            this.labelUsuario.Text = "Usuario";
            // 
            // labelClave
            // 
            this.labelClave.AutoSize = true;
            this.labelClave.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.labelClave.Location = new System.Drawing.Point(204, 219);
            this.labelClave.Name = "labelClave";
            this.labelClave.Size = new System.Drawing.Size(44, 19);
            this.labelClave.TabIndex = 4;
            this.labelClave.Text = "Clave";
            // 
            // btnIniciarSesion
            // 
            this.btnIniciarSesion.Location = new System.Drawing.Point(274, 271);
            this.btnIniciarSesion.Name = "btnIniciarSesion";
            this.btnIniciarSesion.Size = new System.Drawing.Size(130, 23);
            this.btnIniciarSesion.TabIndex = 5;
            this.btnIniciarSesion.Text = "Iniciar Sesion";
            this.btnIniciarSesion.UseVisualStyleBackColor = true;
            this.btnIniciarSesion.Click += new System.EventHandler(this.btnIniciarSesion_Click);
            this.btnIniciarSesion.MouseEnter += new System.EventHandler(this.btnIniciarSesion_Click);
            // 
            // FormLogin
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.btnIniciarSesion);
            this.Controls.Add(this.labelClave);
            this.Controls.Add(this.labelUsuario);
            this.Controls.Add(this.txtClave);
            this.Controls.Add(this.txtUsuario);
            this.Controls.Add(this.label1);
            this.Name = "FormLogin";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "FormLogin";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtUsuario;
        private System.Windows.Forms.TextBox txtClave;
        private System.Windows.Forms.Label labelUsuario;
        private System.Windows.Forms.Label labelClave;
        private System.Windows.Forms.Button btnIniciarSesion;
    }
}