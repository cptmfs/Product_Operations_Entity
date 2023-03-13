using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Urun_Takip_Entity
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        ProductDbEntities db = new ProductDbEntities();
        private void btnListele_Click(object sender, EventArgs e)
        {
            //dataGridView1.DataSource = db.tblMusteri.ToList();
            var degerler = from x in db.tblMusteri
                           select new
                           {
                               x.MusteriID,
                               x.Ad,
                               x.Soyad,
                               x.Sehir,
                               x.Bakiye
                           };
            dataGridView1.DataSource = degerler.ToList();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            tblMusteri t = new tblMusteri();
            t.Ad = txtAd.Text;
            t.Soyad= txtSoyad.Text;
            t.Bakiye = decimal.Parse(txtBakiye.Text);
            t.Sehir = txtSehir.Text;
            db.tblMusteri.Add(t);
            db.SaveChanges();
            MessageBox.Show("Yeni Müşteri Eklendi");
        }

        private void btnSil_Click(object sender, EventArgs e)
        {
            int id = int.Parse(txtID.Text);
            var x = db.tblMusteri.Find(id);
            db.tblMusteri.Remove(x);
            db.SaveChanges();
            MessageBox.Show("Müşteri Sistemden Silindi");
        }

        private void btnGuncelle_Click(object sender, EventArgs e)
        {
            int id = int.Parse(txtID.Text);
            var x = db.tblMusteri.Find(id);
            x.Ad= txtAd.Text;
            x.Soyad = txtSoyad.Text;
            x.Sehir= txtSehir.Text;
            x.Bakiye = decimal.Parse(txtBakiye.Text);
            db.SaveChanges();
            MessageBox.Show("Müşteri Güncelleme İşlemi Gerçekleştirildi");

        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            txtID.Text= dataGridView1.Rows[e.RowIndex].Cells[0].Value.ToString();
            txtAd.Text = dataGridView1.Rows[e.RowIndex].Cells[1].Value.ToString();
            txtSoyad.Text = dataGridView1.Rows[e.RowIndex].Cells[2].Value.ToString();
            txtSehir.Text = dataGridView1.Rows[e.RowIndex].Cells[3].Value.ToString();
            txtBakiye.Text = dataGridView1.Rows[e.RowIndex].Cells[4].Value.ToString();
        }
    }
}
