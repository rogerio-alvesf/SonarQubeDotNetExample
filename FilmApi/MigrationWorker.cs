using Film.Infra.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

namespace FilmApi
{
    [ExcludeFromCodeCoverage]
    public class MigrationWorker : IHostedService
    {
        readonly IServiceProvider provider;
        public MigrationWorker(IServiceProvider provider)
        {
            this.provider = provider;
        }

        public async Task StartAsync(CancellationToken cancellationToken)
        {

            using var scope = provider.CreateScope();
            using var context = scope.ServiceProvider.GetRequiredService<Context>();
            await context.Database.MigrateAsync(CancellationToken.None);
        }

        public Task StopAsync(CancellationToken cancellationToken)
        {
            return Task.CompletedTask;
        }
    }
}
