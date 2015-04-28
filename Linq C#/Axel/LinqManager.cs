using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Linq;
using System.Data.Linq.Mapping;
using System.Configuration;
namespace Axel
{
    public class LinqManager: DataContext
    {
        public Table<albumes> albumes;
        public Table<songs> canciones;
        public LinqManager()
            : base(ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString) { }
    }
    [Table(Name="albumes")]
    public class albumes
    {
        #region Columns
        [Column(IsDbGenerated = true, IsPrimaryKey = true)]
        public int cod_album { get; set; }
        [Column]
        public string nombre { get; set; }
        [Column]
        public int año { get; set; }
        [Column]
        public string descripcion { get; set; }
        [Column]
        public char estado { get; set; }
        #endregion

        #region Methods and Functions
        public bool Insert(albumes nuevo)
        {
            LinqManager db = new LinqManager();
            db.albumes.InsertOnSubmit(nuevo);
            try
            {
                db.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
        public bool UpdateOrDelete(albumes nuevo, bool update)
        {
            LinqManager db = new LinqManager();
            var query = from album in db.albumes where album.cod_album == nuevo.cod_album select album;
            foreach (albumes album in query)
            {
                if (update)
                {
                    album.nombre = nuevo.nombre;
                    album.año = nuevo.año;
                    album.descripcion = nuevo.descripcion;
                }
                else
                    album.estado = 'I';
            }
            try
            {
                db.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
        public object GetDataSource()
        {
            object album = from alb in new LinqManager().albumes where alb.estado == 'A' select alb;
            return album;
        }
        #endregion
    }
    [Table(Name="canciones")]
    public class songs
    {
        #region Columns
        [Column(IsDbGenerated = true, IsPrimaryKey = true)]
        public int cod_cancion { get; set; }
        [Column]
        public int cod_album { get; set; }
        [Column]
        public string nombre { get; set; }
        [Column]
        public string cantantes { get; set; }
        [Column]
        public char estado { get; set; }
        #endregion

        #region Methods and Functions
        public bool Insert(songs nuevo)
        {
            LinqManager db = new LinqManager();
            db.canciones.InsertOnSubmit(nuevo);
            try
            {
                db.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
        public bool UpdateOrDelete(songs cancion, bool update)
        {
            LinqManager db = new LinqManager();
            var song = from list in db.canciones where list.cod_cancion == cancion.cod_cancion select list;
            foreach (songs list in song)
            {
                if (update)
                {
                    list.cod_album = cancion.cod_album;
                    list.nombre = cancion.nombre;
                    list.cantantes = cancion.cantantes;
                }
                else
                    list.estado = 'I';
            }
            try
            {
                db.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
        public object getDataSource()
        {
            return from song in new LinqManager().canciones where song.estado == 'A' select song;
        }
        #endregion
    }
}