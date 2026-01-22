import '../models/classes.dart';
import '../data/repositories.dart';

// Movie functions
void movieCheck(Movie m) {
  if (m.avaliable) {
    print('Este filme está disponível');
  } else {
    print('Este filme não está disponível');
  }
}

void createMovie({
  required MovieRepository repository,
  required int id,
  required String title,
  required String category,
}) {
  Movie m = Movie(code: id, title: title, category: category);
  repository.add(m);
  print('Filme cadastrado com sucesso!');
  m.showInfo();
}

// Client functions
void createClient({
  required ClientRepository repository,
  required int id,
  required String nome,
  required String cpf,
}) {
  Client c = Client(code: id, name: nome, cpf: cpf);
  repository.add(c);
  print('Cliente cadastrado com sucesso!');
  c.showData();
}

void blockClient(Client c) {
  c.deactivate();
  print('Cliente bloqueado com sucesso!');
}

void unblockClient(Client c) {
  c.activate();
  print('Cliente desbloqueado com sucesso!');
}

// Borrow functions
void makeBorrow({
  required BorrowRepository repository,
  required Client c,
  required Movie m,
}) {
  if (c.active) {
    if (m.avaliable) {
      Borrow b = Borrow(c: c, m: m);
      repository.add(b);

      m.borrow();
      b.detail();
    } else {
      print('Emprestimo não realizado: Filme não disponível');
    }
  } else {
    print('Emprestimo não realizado: Cliente não está ativo');
  }
}
