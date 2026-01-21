import '../models/classes.dart';
import '../data/repositories.dart';

void movieCheck(Movie m) {
  if (m.avaliable) {
    print('Este filme está disponível');
  } else {
    print('Este filme não está disponível');
  }
}

void makeBorrow(Client c, Movie m) {
  var br = BorrowRepository();
  if (c.active) {
    if (m.avaliable) {
      Borrow b = Borrow(c: c, m: m);
      br.add(b);

      m.borrow();

      b.detail();
    } else {
      print('Emprestimo não realizado: Filme não disponível');
    }
  } else {
    print('Emprestimo não realizado: Cliente não está ativo');
  }
}
