using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace Models.Framework
{
    public partial class FreeCy : DbContext
    {
        public FreeCy()
            : base("name=FreeCy")
        {
        }

        public virtual DbSet<Bid> Bids { get; set; }
        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<Construction> Constructions { get; set; }
        public virtual DbSet<Conversation> Conversations { get; set; }
        public virtual DbSet<Message> Messages { get; set; }
        public virtual DbSet<MessageType> MessageTypes { get; set; }
        public virtual DbSet<MessRoom> MessRooms { get; set; }
        public virtual DbSet<Payment> Payments { get; set; }
        public virtual DbSet<ProcessLog> ProcessLogs { get; set; }
        public virtual DbSet<Product> Products { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<Role> Roles { set; get; }
        public virtual DbSet<Credential> Credentials { set; get; }

        public virtual DbSet<UserGroup> UserGroups { set; get; }
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Bid>()
                .HasMany(e => e.Constructions)
                .WithRequired(e => e.Bid)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Category>()
                .HasMany(e => e.Products)
                .WithRequired(e => e.Category)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Construction>()
                .HasMany(e => e.Payments)
                .WithRequired(e => e.Construction)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Construction>()
                .HasMany(e => e.ProcessLogs)
                .WithRequired(e => e.Construction)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<MessageType>()
                .HasMany(e => e.Messages)
                .WithRequired(e => e.MessageType)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<MessRoom>()
                .HasMany(e => e.Conversations)
                .WithRequired(e => e.MessRoom)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<MessRoom>()
                .HasMany(e => e.Messages)
                .WithRequired(e => e.MessRoom)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Product>()
                .Property(e => e.Price)
                .HasPrecision(18, 0);

            modelBuilder.Entity<Product>()
                .HasMany(e => e.Bids)
                .WithRequired(e => e.Product)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<User>()
                .Property(e => e.Address)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.WorkTime)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .HasMany(e => e.Bids)
                .WithRequired(e => e.User)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<User>()
                .HasOptional(e => e.Conversation)
                .WithRequired(e => e.User);

            modelBuilder.Entity<User>()
                .HasMany(e => e.Messages)
                .WithRequired(e => e.User)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<User>()
                .HasMany(e => e.Products)
                .WithRequired(e => e.User)
                .WillCascadeOnDelete(false);
            modelBuilder.Entity<User>()
           .Property(loginData => loginData.Password)
           .HasMaxLength(20);
        }

        public System.Data.Entity.DbSet<Models.Framework.Login> Logins { get; set; }

        public System.Data.Entity.DbSet<Models.Framework.Register> Registers { get; set; }

        public System.Data.Entity.DbSet<Models.Framework.ResetPasswordModel> ResetPasswordModels { get; set; }
    }
}
