﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class ProductDbEntities : DbContext
    {
        public ProductDbEntities()
            : base("name=ProductDbEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<tblAdmin> tblAdmin { get; set; }
        public virtual DbSet<tblKategori> tblKategori { get; set; }
        public virtual DbSet<tblMusteri> tblMusteri { get; set; }
        public virtual DbSet<tblSatislar> tblSatislar { get; set; }
        public virtual DbSet<tblUrunler> tblUrunler { get; set; }
    }
}