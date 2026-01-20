import '../models/classes.dart';

void clientData(Client c) {
  print("""
  Nome: ${c.name}
  Codigo: ${c.code}
  """);
}

void movieCheck (Movie m) {
  if (m.avaliable) {
    print('Este filme está disponível');
  }
  else {
    print('Este filme não está disponível');
  }
}

void makeBorrow(Client c, Movie m) {
  if (c.active) {
    if (m.avaliable) {
      Borrow b = Borrow(c: c, m: m);
      m.borrow();

      b.detail();
    }
    else {
      print('Emprestimo não realizado: Filme não disponível');
    }
  }
  else {
    print('Emprestimo não realizado: Cliente não está ativo');
  }
}