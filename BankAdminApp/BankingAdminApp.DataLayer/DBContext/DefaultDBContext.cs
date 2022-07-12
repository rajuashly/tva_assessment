using BankingAdminApp.DataLayer.EntityClasses;
using Microsoft.EntityFrameworkCore;
using System.Reflection.Emit;

namespace BankingAdminApp.DataLayer.DBContext
{
    public partial class DefaultDBContext : DbContext
    {
        public DefaultDBContext(
       DbContextOptions<DefaultDBContext> options)
         : base(options)
        {

        }

        public virtual DbSet<Accounts> Accounts { get; set; }
        public virtual DbSet<Persons> Persons { get; set; }
        public virtual DbSet<Transactions> Transactions { get; set; }


        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Accounts>(entity =>
            {
                entity.HasKey(e => e.code);

                entity.HasIndex(e => e.account_number, "IX_Account_num")
                    .IsUnique();

                entity.Property(e => e.account_number)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.is_active)
                    .IsRequired()
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.outstanding_balance).HasColumnType("money");

                entity.HasOne(d => d.Person)
                    .WithMany(p => p.Accounts)
                    .HasForeignKey(d => d.person_code)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Account_Person");
            });

            modelBuilder.Entity<Persons>(entity =>
            {
                entity.HasKey(e => e.code);

                entity.HasIndex(e => e.id_number, "IX_Person_id")
                    .IsUnique();
                entity.Property(e => e.is_deleted)
                .IsRequired()
                .HasDefaultValueSql("((0))");
                entity.Property(e => e.id_number)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.name)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.surname)
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Transactions>(entity =>
            {
                entity.HasKey(e => e.code);

                entity.Property(e => e.amount).HasColumnType("money");

                entity.Property(e => e.capture_date).HasColumnType("datetime");

                entity.Property(e => e.description)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.transaction_date).HasColumnType("datetime");

                entity.HasOne(d => d.Account)
                    .WithMany(p => p.Transactions)
                    .HasForeignKey(d => d.account_code)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Transaction_Account");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
