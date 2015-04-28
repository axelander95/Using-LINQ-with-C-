using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Axel
{
    public partial class Album : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                Session["mode"] = "N";
        }

        protected void GridView1_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridView1.DataSource = new albumes().GetDataSource();
                GridView1.DataBind();
            }
        }

        protected void btnProcesar_Click(object sender, EventArgs e)
        {
            bool band = false;
            if (Session["mode"] == "N")
            {
                albumes nuevo = new albumes();
                nuevo.nombre = txtNombre.Text;
                nuevo.año = Convert.ToInt32(txtAño.Text);
                nuevo.descripcion = txtDescripcion.Text;
                nuevo.estado = 'A';
                band = nuevo.Insert(nuevo);
            }
            else
            {
                albumes updateObject = new albumes();
                updateObject.cod_album = Convert.ToInt32(txtCodigo.Text);
                updateObject.nombre = txtNombre.Text;
                updateObject.año = Convert.ToInt32(txtAño.Text);
                updateObject.descripcion = txtDescripcion.Text;
                if (Session["mode"] == "M")
                band = updateObject.UpdateOrDelete(updateObject, true);
                else
                    band = updateObject.UpdateOrDelete(updateObject, false);
            }
            if (band)
                Response.Redirect(Request.RawUrl);
            else
                lblMensaje.Text = "Error en la operacion.";
        }
        protected void FillFields(int i)
        {
            txtCodigo.Text = GridView1.Rows[i].Cells[1].Text;
            txtNombre.Text = GridView1.Rows[i].Cells[2].Text;
            txtAño.Text = GridView1.Rows[i].Cells[3].Text;
            txtDescripcion.Text = GridView1.Rows[i].Cells[4].Text;
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "M")
            {
                Session["mode"] = "M";
                enableControls(true);
            }
            else
            {
                Session["mode"] = "E";
                enableControls(false);
            }
            FillFields(Convert.ToInt32(e.CommandArgument));
        }
        protected void enableControls(bool band)
        {
            txtNombre.Enabled = band;
            txtDescripcion.Enabled = band;
            txtAño.Enabled = band;
        }
        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            txtNombre.Text = String.Empty;
            txtCodigo.Text = String.Empty;
            txtAño.Text = String.Empty;
            txtDescripcion.Text = String.Empty;
            enableControls(true);
            Session["mode"] = "N";
        }
    }
}