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
        {
            return _context.Films.Find(id);
        }

        public async Task Delete(Guid id)
        {
            var book = _context.Films.Find(id);
            _context.Films.Remove(book);
            await _context.SaveChangesAsync();
        }

        public async Task Update(FilmDto film)
        {
            _context.Update(film);
            await _context.SaveChangesAsync();
        }
    }
}
