using Microsoft.EntityFrameworkCore;
using Abp.Zero.EntityFrameworkCore;
using UET.EasyAccommod.Authorization.Roles;
using UET.EasyAccommod.Authorization.Users;
using UET.EasyAccommod.MultiTenancy;
using UET.EasyAccommod.Note;
using UET.EasyAccommod.Study;

namespace UET.EasyAccommod.EntityFrameworkCore
{
    public class EasyAccommodDbContext : AbpZeroDbContext<Tenant, Role, User, EasyAccommodDbContext>
    {
        /* Define a DbSet for each entity of the application */
        public DbSet<UserNote> UserNotes { get; set; }
        public DbSet<Book> Books { get; set; }
        public DbSet<Unit> Units { get; set; }
        public DbSet<Vocabulary> Vocabularies { get; set; }
        public DbSet<LesonTreeWord> LesonTreeWords { get; set; }

        public EasyAccommodDbContext(DbContextOptions<EasyAccommodDbContext> options)
            : base(options)
        {
        }
    }
}
