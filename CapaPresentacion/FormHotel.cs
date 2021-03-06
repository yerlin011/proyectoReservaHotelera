using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using CapaNegocio;
using System.Data.SqlClient;



namespace CapaPresentacion
{

    public partial class FormHoteles : Form
    {
        #region
        //SqlConnection conexion = new SqlConnection("Data Source = YERLIN022\\SQLEXPRESS;Initial Catalog = REGISTRO_TUTORIAS_ACADEMICA; Integrated Security = True");
        #endregion

        CN_Hotel objetoCN = new CN_Hotel();
        public string idHotel = "";
        public bool estado=false;
        public string Operacion = "Insertar";


        public FormHoteles()
        {
            InitializeComponent();
        }

        private void FormHoteles_Load(object sender, EventArgs e)
        {
            MostrarHoteles();
        }

        private void MostrarHoteles()
        {

            CN_Hotel objeto = new CN_Hotel();
            dataGridViewHoteles.DataSource = objeto.ListarHoteles();
            this.dataGridViewHoteles.Columns["idhotel"].Visible = false;
        }
        private void MostrarCarreras()
        {

            //CN_Estudiantes objeto = new CN_Estudiantes();
            //FormMantEstudiantes frm = new FormMantEstudiantes();
            //frm.cbmCarrera.DataSource = objeto.MostrarCarr();
            //frm.cbmCarrera.DisplayMember = "Nombre_Carrera";
            //frm.cbmCarrera.ValueMember = "Id_Carrera";
        }
        private void MostrarMaterias()
        {
            //CN_Estudiantes objeto = new CN_Estudiantes();
            //FormMantEstudiantes frm = new FormMantEstudiantes();

            //frm.cmbMateria.DataSource = objeto.MostrarMate();
            //frm.cmbMateria.DisplayMember = "Nombre_Materia";
            //frm.cmbMateria.ValueMember = "Id_Materia";

        }

       
        private void LimpiarForm()
        {
            //txtMatricula.Clear();
            //txtNombre.Clear();
            //txtApellido.Clear();
            //cbmCarrera.Text = "Carrera";
            //txtEstado.Clear();
        }

       

     
        private void txtBuscar_TextChanged(object sender, EventArgs e)
        {

            //CN_Empleado objbe = new CN_Empleado();
            //dataGridView2.DataSource = objetoCN.BuscarEst(txtBuscar.Text);
            //objetoCN.BuscarEst(txtMatricula.Text, txtNombre.Text);
        }

        private void txtBuscar_KeyUp(object sender, KeyEventArgs e)
        {
             CN_Hotel objetobusqueda = new CN_Hotel();
             dataGridViewHoteles.DataSource =objetobusqueda.BuscarHoteles(txtBuscar.Text);

        }

       
        private void btnNuevo_Click(object sender, EventArgs e)
        {

            FormMantHotel frm = new FormMantHotel();
            frm.Operacion = "Insertar";
            frm.ShowDialog();
            MostrarHoteles();

        }

        private void btnEditarF2_Click(object sender, EventArgs e)
        {

           
            
            if (dataGridViewHoteles.SelectedRows.Count > 0)
            {


                FormMantHotel frm = new FormMantHotel();


                //EDITAR
              
                 frm.Operacion = "Editar";
               
                
                 frm.idHotel = dataGridViewHoteles.CurrentRow.Cells["idhotel"].Value.ToString();

                 frm.txtNombre.Text = dataGridViewHoteles.CurrentRow.Cells["NOMBRE"].Value.ToString();
                 frm.txtDescripcion.Text = dataGridViewHoteles.CurrentRow.Cells["DESCRIPCION"].Value.ToString();
                 frm.txtCategoria.Text = dataGridViewHoteles.CurrentRow.Cells["CATEGORIA"].Value.ToString();
                 frm.txtDomicilio.Text = dataGridViewHoteles.CurrentRow.Cells["DOMICILIO"].Value.ToString();
                 frm.txtLocalidad.Text = dataGridViewHoteles.CurrentRow.Cells["LOCALIDAD"].Value.ToString();
                 frm.txtProvincia.Text = dataGridViewHoteles.CurrentRow.Cells["PROVINCIA"].Value.ToString();
                 frm.txtCodPostal.Text = dataGridViewHoteles.CurrentRow.Cells["CODPOSTAL"].Value.ToString();
                 frm.mskTelefono.Text = dataGridViewHoteles.CurrentRow.Cells["TELEFONO"].Value.ToString();
                 frm.cmbAdministrador.Text = dataGridViewHoteles.CurrentRow.Cells["ADMINISTRADOR"].Value.ToString();
                 frm.ShowDialog();
                 MostrarHoteles();

            }
            else
            {
                MessageBox.Show("Seleccione una fila por favor");
            }
        }

        private void btnEliminar_Click(object sender, EventArgs e)
        {
            if (dataGridViewHoteles.SelectedRows.Count > 0)
            {
                DialogResult resultAccion = MessageBox.Show("¿Desea eliminar el hotel?",
                "Eliminacion", MessageBoxButtons.YesNo, MessageBoxIcon.Question);

                if (resultAccion == DialogResult.Yes)
                {

                    idHotel = dataGridViewHoteles.CurrentRow.Cells["idhotel"].Value.ToString();
                    objetoCN.EliminarHoteles(idHotel);
                    MostrarHoteles();
                }
            }
            else
            {
                MessageBox.Show("Seleccione una fila por favor");
            }
        }
    }
}


        

 

