using Film.Domain.Entities;
using Film.Infra.Data;
using System;
using System.Threading.Tasks;

namespace Film.Infra.Repositories
{
    public class FilmRepository
    {
        private readonly Context _context;

        public FilmRepository(Context context) => _context = context;

        public async Task Add(FilmDto film)
        {
            _context.Films.Add(film);
            await _context.SaveChangesAsync();
        }

        public async Task<FilmDto> GetById(Guid id)
            => await _context.Films.FindAsync(id);

        public async Task Delete(Guid id)
        {
            var film = await _context.Films.FindAsync(id);
            if (film != null)
            {
                 _context.Films.Remove(film);
                await _context.SaveChangesAsync();
            }
        }

        public async Task Update(FilmDto film)
        {
            _context.Update(film);
            await _context.SaveChangesAsync();
        }
    }
}
