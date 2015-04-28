using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Axel
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnAlbum_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Album.aspx");
        }

        protected void btnCanciones_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Songs.aspx");
        }

        protected void lkConsulta_Click(object sender, EventArgs e)
        {

        }
    }
}
