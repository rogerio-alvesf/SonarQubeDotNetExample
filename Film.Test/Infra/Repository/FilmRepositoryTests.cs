using Film.Domain.Entities;
using Film.Test.Shared;
using Film.Infra.Repositories;
using System.Threading.Tasks;
using Xunit;

namespace Film.Test.Infra.Repository
{
    public class FilmRepositoryTests
    {
        [Fact]
        public async Task Should_Add_Get_And_Delete_Film()
        {
            //Arrange
            string name = "Superman";
            var film= new FilmDto(name);

            //Act
            //insiro o filme
            var ctx = DbFactory.CreateContext();
            var repo = new FilmRepository(ctx);
            await repo.Add(film);
            ctx.Dispose();

            //busco o filme pelo ID
            ctx = DbFactory.CreateContext();
            repo = new FilmRepository(ctx);
            var dbFilm = await repo.GetById(film.Id);
            ctx.Dispose();

            //Assert
            Assert.Equal(dbFilm.Name, film.Name);
            Assert.Equal(dbFilm.Id, film.Id);

            //Atualizo o filme
            ctx = DbFactory.CreateContext();
            dbFilm.UpdateProperties("updated_" + name);
            repo = new FilmRepository(ctx);
            await repo.Update(dbFilm);
            ctx.Dispose();

            //busco o filme pelo ID
            ctx = DbFactory.CreateContext();
            repo = new FilmRepository(ctx);
            var updatedDbFilm = await repo.GetById(film.Id);
            ctx.Dispose();

            //Assert
            Assert.Equal(dbFilm.Name, updatedDbFilm.Name);
            Assert.Equal(dbFilm.Id, updatedDbFilm.Id);

            //deleto o filme
            ctx = DbFactory.CreateContext();
            repo = new FilmRepository(ctx);
            await repo.Delete(film.Id);
            ctx.Dispose();
        }
    }
}
