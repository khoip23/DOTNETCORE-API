using Microsoft.EntityFrameworkCore;

namespace dotnet_v8_blazor.Models
{
    public class StoreCyberSoftContext : DbContext
    {
        public StoreCyberSoftContext() { }

        public StoreCyberSoftContext(DbContextOptions<StoreCyberSoftContext> options)
            : base(options) { }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(
                "Server=127.0.0.1,1433;Database=StoreCybersoft;User Id=sa;Password=Khoideptrai312@;TrustServerCertificate=True"
            );
        }

        public DbSet<User> Users { get; set; }
        public DbSet<Product> Products { get; set; }
    }
}
