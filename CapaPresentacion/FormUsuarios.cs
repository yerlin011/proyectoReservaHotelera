using CapaNegocio;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CapaPresentacion
{
    public partial class FormUsuarios : Form
    {
        private CN_Usuario objetoCN = new CN_Usuario();
        private string idUsuario = null;

        public FormUsuarios()
        {
            InitializeComponent();
        }

        private void FormUsuarios_Load(object sender, EventArgs e)
        {
            ListarDatosUsuarios();
        }

        /// <summary>
        /// Metodo carga los datos de la tabla usuarios a el objeto dataGridView
        /// </summary>
        private void ListarDatosUsuarios()
        {
            CN_Usuario objeto = new CN_Usuario();
            dataGridViewUsuarios.DataSource = objeto.ListarUsuarios();
            this.dataGridViewUsuarios.Columns["idusuario"].Visible = false;


        }
    }
}
