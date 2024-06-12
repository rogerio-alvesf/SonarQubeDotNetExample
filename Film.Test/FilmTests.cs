using Film.Domain.Entities;
using System;
using Xunit;

namespace Film.Test
{
    public class FilmTests
    {
        [Fact]
        public void Should_Create_Film()
        {
            //Arrange
            string name = "Batman Begins";

            //Act
            var film = new FilmDto(name);

            //Assert
            Assert.NotNull(film);
            Assert.Equal(name, film.Name);
            Assert.IsType<Guid>(film.Id);
        }

        [Fact]
        public void Should_Update_Film_Properties()
        {
            //Arrange
            string name = "Spider Man";
            var film = new FilmDto(name);
            string updatedName = "updated_" + name;

            //Act
            film.UpdateProperties(updatedName);

            //Assert
            Assert.NotNull(film);
            Assert.Equal(updatedName, film.Name);
            Assert.IsType<Guid>(film.Id);
        }
    }
}
