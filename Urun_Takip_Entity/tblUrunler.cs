//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Urun_Takip_Entity
{
    using System;
    using System.Collections.Generic;
    
    public partial class tblUrunler
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tblUrunler()
        {
            this.tblSatislar = new HashSet<tblSatislar>();
        }
    
        public int UrunID { get; set; }
        public string UrunAd { get; set; }
        public Nullable<short> Stok { get; set; }
        public Nullable<decimal> AlisFiyat { get; set; }
        public Nullable<decimal> SatisFiyat { get; set; }
        public Nullable<int> Kategori { get; set; }
    
        public virtual tblKategori tblKategori { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblSatislar> tblSatislar { get; set; }
    }
}
