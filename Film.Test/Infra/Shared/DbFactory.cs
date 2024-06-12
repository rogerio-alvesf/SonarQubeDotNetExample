using Film.Infra.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using System.IO;

namespace Film.Test.Shared
{
    public static class DbFactory
    {
        private static IConfiguration getConfigurations()
        {
            IConfigurationBuilder configurationBuilder = new ConfigurationBuilder();
            var projectDir = Directory.GetCurrentDirectory();
            var configPath = Path.Combine(projectDir, "appsettings.test.json");
            configurationBuilder.AddJsonFile(configPath);

            return configurationBuilder.Build();
        }

        public static Context CreateContext()
        {
            var configuration = getConfigurations();
            var options = new DbContextOptionsBuilder<Context>()
               .UseSqlServer(configuration.GetConnectionString("DefaultConnection"))
               .Options;

            return new Context(options);
        }
    }
}
