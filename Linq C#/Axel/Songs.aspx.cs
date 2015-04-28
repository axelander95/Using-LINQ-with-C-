using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Axel
{
    public partial class Songs : System.Web.UI.Page
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
                GridView1.DataSource = new songs().getDataSource();
                GridView1.DataBind();
            }
        }

        protected void ddlAbum_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlAbum.DataSource = new albumes().GetDataSource();
                ddlAbum.DataTextField = "nombre";
                ddlAbum.DataValueField = "cod_album";
                ddlAbum.DataBind();
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            bool band = false;
            songs cancion = new songs();
            cancion.nombre = txtNombre.Text;
            cancion.cod_album = Convert.ToInt32(ddlAbum.SelectedValue);
            cancion.cantantes = txtCantantes.Text;
            if (Session["mode"] == "N")
            {
                cancion.estado = 'A';
                band = cancion.Insert(cancion);
            }
            else
            {
                cancion.cod_cancion = Convert.ToInt32(txtCodigo.Text);
                if (Session["mode"] == "M")
                    band = cancion.UpdateOrDelete(cancion, true);
                else
                {
                    cancion.estado = 'I';
                    band = cancion.UpdateOrDelete(cancion, false);
                }
            }
            if (band)
                Response.Redirect(Request.RawUrl);
            else
                lblMensaje.Text = "Operación no realizada.";
        }
        protected void enableControls(bool band)
        {
            txtNombre.Enabled = band;
            ddlAbum.Enabled = band;
            txtCantantes.Enabled = band;
        }
        protected void FillFields(int i)
        {
            txtCodigo.Text = GridView1.Rows[i].Cells[1].Text;
            ddlAbum.SelectedValue = GridView1.Rows[i].Cells[2].Text;
            txtNombre.Text = GridView1.Rows[i].Cells[3].Text;
            txtCantantes.Text = GridView1.Rows[i].Cells[4].Text;
        }
        protected void btnClean_Click(object sender, EventArgs e)
        {
            txtNombre.Text = String.Empty;
            txtCantantes.Text = String.Empty;
            ddlAbum.SelectedIndex = -1;
            enableControls(true);
            Session["mode"] = "N";
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            FillFields(Convert.ToInt32(e.CommandArgument));
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
        }
    }
}