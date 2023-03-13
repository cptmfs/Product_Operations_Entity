using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Security.Cryptography.Xml;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Urun_Takip_Entity
{
    public partial class IstatistikForm : Form
    {
        public IstatistikForm()
        {
            InitializeComponent();
        }
        ProductDbEntities db= new ProductDbEntities();
        private void IstatistikForm_Load(object sender, EventArgs e)
        {
            DateTime bugun= DateTime.Today; // Bugunun tarihini tutacak bir değişken tanımladık..
            lblMusteriSayisi.Text = db.tblMusteri.Count().ToString();
            lblUrunSayisi.Text=db.tblUrunler.Count().ToString();    
            lblKategoriSayisi.Text=db.tblKategori.Count().ToString();   
            lblBeyazEsyaSayisi.Text=db.tblUrunler.Count(x=> x.Kategori==1).ToString();
            lblToplamStok.Text=db.tblUrunler.Sum(x=>x.Stok).ToString();
            lblGunlukSatis.Text=db.tblSatislar.Count(x=>x.Tarih==bugun).ToString();
            lblToplamKasa.Text=db.tblSatislar.Sum(x=>x.Toplam).ToString()+ " ₺";
            lblGunlukKasa.Text=db.tblSatislar.Where(x=>x.Tarih==bugun).Sum(i=>i.Toplam).ToString() + " ₺";
            lblEnYuksekFiyatUrun.Text=(from x in db.tblUrunler orderby x.SatisFiyat descending 
                                       select x.UrunAd).FirstOrDefault(); // First or Default İlk Sıradaki Veriyi Getirir..
            lblEnDusukFiyatlıUrun.Text=(from x in db.tblUrunler orderby x.SatisFiyat ascending
                                        select x.UrunAd).FirstOrDefault();
            lblEnFazlaStok.Text=(from x in db.tblUrunler orderby x.Stok descending
                                 select x.UrunAd).FirstOrDefault();
            lblEnAzStok.Text=(from x in db.tblUrunler orderby x.Stok ascending
                                 select x.UrunAd).FirstOrDefault();
                                                                            
        }
    }
}
