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
    public partial class UrunlerForm : Form
    {
        public UrunlerForm()
        {
            InitializeComponent();
        }
        ProductDbEntities db = new ProductDbEntities();
        private void UrunlerForm_Load(object sender, EventArgs e)
        {
            UrunListesi();
            cbxKategori.DataSource = db.tblKategori.ToList();
            cbxKategori.DisplayMember = "Ad";
            cbxKategori.ValueMember = "ID";
            

        }
        void UrunListesi()
        {
            var urunler = from x in db.tblUrunler
                          select new
                          {
                              x.UrunID,
                              x.UrunAd,
                              x.Stok,
                              x.AlisFiyat,
                              x.SatisFiyat,
                              x.tblKategori.Ad
                          };
            dataGridView1.DataSource = urunler.ToList();
        }
        void Temizle()
        {
            txtID.Text = "";
            txtUrunAd.Text = "";
            txtStok.Text = "";
            txtAlisFiyat.Text = "";
            txtSatisFiyat.Text = "";
        }
        private void btnListele_Click(object sender, EventArgs e)
        {
            //dataGridView1.DataSource = db.tblUrunler.ToList();
            UrunListesi();
        }

        private void btnKaydet_Click(object sender, EventArgs e)
        {
            tblUrunler u = new tblUrunler();
            u.UrunAd = txtUrunAd.Text;
            u.Stok = short.Parse(txtStok.Text);
            u.AlisFiyat = decimal.Parse(txtAlisFiyat.Text);
            u.SatisFiyat = decimal.Parse(txtSatisFiyat.Text);
            u.Kategori = int.Parse(cbxKategori.SelectedValue.ToString());
            db.tblUrunler.Add(u);
            db.SaveChanges();
            MessageBox.Show("Ürün başarılı bir şekilde eklendi");
            UrunListesi();
            Temizle();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            txtID.Text = dataGridView1.Rows[e.RowIndex].Cells[0].Value.ToString();
            txtUrunAd.Text = dataGridView1.Rows[e.RowIndex].Cells[1].Value.ToString();
            txtStok.Text = dataGridView1.Rows[e.RowIndex].Cells[2].Value.ToString();
            txtAlisFiyat.Text = dataGridView1.Rows[e.RowIndex].Cells[3].Value.ToString();
            txtSatisFiyat.Text = dataGridView1.Rows[e.RowIndex].Cells[4].Value.ToString();
            cbxKategori.Text = dataGridView1.Rows[e.RowIndex].Cells[5].Value.ToString();
        }

        private void btnSil_Click(object sender, EventArgs e)
        {
            if (txtID.Text != "")
            {
                int id = int.Parse(txtID.Text);
                var x = db.tblUrunler.Find(id);
                db.tblUrunler.Remove(x);
                db.SaveChanges();
                MessageBox.Show("Ürün başarılı bir şekilde silindi", "Silme İşlemi", MessageBoxButtons.OK, MessageBoxIcon.Stop);
            }
            else
            {
                MessageBox.Show("Lütfen verileri listeledikten sonra bir satıra tıklayıp silmek istediğiniz kaydı seçiniz.", "Uyarı", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            UrunListesi();
            Temizle();
        }

        private void btnGuncelle_Click(object sender, EventArgs e)
        {
            int id = int.Parse(txtID.Text);
            var x = db.tblUrunler.Find(id);
            x.UrunAd = txtUrunAd.Text;
            x.Stok = short.Parse(txtStok.Text);
            x.AlisFiyat = decimal.Parse(txtAlisFiyat.Text);
            x.SatisFiyat = decimal.Parse(txtSatisFiyat.Text);
            x.Kategori = int.Parse(cbxKategori.SelectedValue.ToString());
            db.SaveChanges();
            MessageBox.Show("Ürün başarılı bir şekilde güncellendi", "Güncelleme İşlemi", MessageBoxButtons.OK, MessageBoxIcon.Information);
            UrunListesi();
            Temizle();
        }
    }
}
