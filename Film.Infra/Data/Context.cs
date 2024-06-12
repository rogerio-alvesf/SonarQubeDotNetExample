using Film.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics.CodeAnalysis;

namespace Film.Infra.Data
{
    [ExcludeFromCodeCoverage]
    public class Context : DbContext
    {
        public DbSet<FilmDto> Films { get; set; }

        public Context([NotNull] DbContextOptions<Context> options) : base(options)
        {

        }
    }
}
