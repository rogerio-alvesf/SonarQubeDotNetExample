using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using System.Diagnostics.CodeAnalysis;
using Film.Infra.Data;

namespace FilmApi.Configuration
{
    [ExcludeFromCodeCoverage]
    public static class DataConfiguration
    {
        public static IServiceCollection AddCustomDataContext(
            this IServiceCollection services,
            IConfiguration configuration
        )
        {
            string securityConnection = configuration.GetConnectionString("DefaultConnection");

            services.AddScoped((provider) =>
            {
                return new DbContextOptionsBuilder<Context>()
                .UseSqlServer(securityConnection)
                .Options;
            });


            services.AddDbContext<Context>();

            return services;
        }

    }
}
