String getGenre(int id) {
  String genre;
  if (id == 28) {
    genre = 'Acción';
  } else if (id == 12) {
    genre = 'Aventura';
  } else if (id == 16) {
    genre = 'Animación';
  } else if (id == 35) {
    genre = 'Comedia';
  } else if (id == 80) {
    genre = 'Crimen';
  } else if (id == 99) {
    genre = 'Documental';
  } else if (id == 18) {
    genre = 'Drama';
  } else if (id == 10751) {
    genre = 'Familia';
  } else if (id == 14) {
    genre = 'Fantasía';
  } else if (id == 36) {
    genre = 'Historia';
  } else if (id == 27) {
    genre = 'Terror';
  } else if (id == 10402) {
    genre = 'Música';
  } else if (id == 9648) {
    genre = 'Misterio';
  } else if (id == 10749) {
    genre = 'Romance';
  } else if (id == 878) {
    genre = 'Ciencia Ficción';
  } else if (id == 10770) {
    genre = 'Película de TV';
  } else if (id == 53) {
    genre = 'Suspenso';
  } else if (id == 10752) {
    genre = 'Bélica';
  } else if (id == 37) {
    genre = 'Western';
  } else {
    genre = 'No especificado';
  }
  return genre;
}
