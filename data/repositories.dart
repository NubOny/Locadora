import '../models/classes.dart';

class ClientRepository {
  final List<Client> _clients = [];

  void add(Client client) => _clients.add(client);

  void listClients() {
    for (Client client in _clients) {
      if (client.active){
      client.showData();
      }
      else {
        print('Nao ha clientes ativos.');
      }
    }
  }

  Client? findByCode(int code) {
    for (final client in _clients) {
      if (client.code == code) {
        return client;
      }
    }
    return null;
  }
}

class MovieRepository {
  final List<Movie> _movies = [];

  void add(Movie movie) => _movies.add(movie);

  void listMovies() {
    for (var movie in _movies) {
      movie.showInfo();
    }
  }

  Movie? findByCode(int code) {
    for (final movie in _movies) {
      if (movie.code == code) {
        return movie;
      }
    }
    return null;
  }
}

class BorrowRepository {
  final List<Borrow> _borrow = [];

  void add(Borrow borrow) => _borrow.add(borrow);

  void listBorrow() {
    for (var borrow in _borrow) {
      if (borrow.active) {
        borrow.detail();
      }
    }
  }
}
