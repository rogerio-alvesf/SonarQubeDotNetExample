using System;

namespace Film.Domain.Entities
{
    public class FilmDto
    {
        public Guid Id { get; private set; }
        public string Name { get; private set; }

        public FilmDto(string name)
        {
            this.Id = Guid.NewGuid();
            Name = name;
        }

        public void UpdateProperties(string name)
        {
            this.Name = name;
        }
    }
}
