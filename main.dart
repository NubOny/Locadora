import 'dart:io';
import 'models/classes.dart';
import 'func/funcoes.dart';
import 'data/repositories.dart';

void main() {
  int id_cliente = 1;
  var clientRepo = ClientRepository();
  int bloqueados = 0;
  int id_filme = 1;
  var movieRepo = MovieRepository();
  var borrowRepo = BorrowRepository();
  bool rodando = true;

  print('Bem vindo ao sistema');
  while (rodando) {
    print("""
    1 - Cadastrar novo cliente
    2 - Mostrar todos os clientes ativos
    3 - Bloquear cliente
    4 - Desbloquear cliente
    5 - Cadastrar Filme
    6 - Listar Filmes
    7 - Verificar disponibilidade de filme
    8 - Fazer novo Emprestimo
    9 - Verificar Emprestimos Ativos
    0 - Sair
    """);
    final int input = int.parse(stdin.readLineSync()!);

    switch (input) {
      case 1:
        print('Qual o nome do cliente?');
        String name = stdin.readLineSync()!;
        print('Qual o CPF?');
        String cpf = stdin.readLineSync()!;

        clientRepo.add(Client(name: name, cpf: cpf, code: id_cliente));
        id_cliente++;

        break;

      case 2:
        clientRepo.listClients();
        break;

      case 3:
        if (bloqueados != 0) {
          print('Não há Clientes Bloqueados.');
          break;
        } else {
          print(
            'Qual o ID do cliente para ser bloqueado? (Digite 0 para sair)\n',
          );
          int idBlock = int.parse(stdin.readLineSync()!);

          clientRepo.findByCode(idBlock)?.deactivate();

          break;
        }

      case 4:
        print('Qual o ID do cliente para ser bloqueado?');
        int idUnblock = int.parse(stdin.readLineSync()!);

        clientRepo.findByCode(idUnblock)?.activate();
        break;

      case 5:
        print('Qual o titulo do Filme?');
        String title = stdin.readLineSync()!;
        print('Qual a Categoria do Filme?');
        String category = stdin.readLineSync()!;

        movieRepo.add(Movie(category: category, title: title, code: id_filme));
        id_filme++;

        break;

      case 6:
        movieRepo.listMovies();
        break;

      case 7:
        print('Qual o codigo do filme? (Digite 0 para sair)\n');
        int input = int.parse(stdin.readLineSync()!);
        if (input == 0) {
          break;
        } else {
          movieCheck(movieRepo.findByCode(input)!);
        }
        break;

      case 8:
        print('Qual o ID do cliente? ');
        int clientBorrow = int.parse(stdin.readLineSync()!);
        print('Qual o ID do Filme? ');
        int movieBorrow = int.parse(stdin.readLineSync()!);

        makeBorrow(
          clientRepo.findByCode(clientBorrow)!, 
          movieRepo.findByCode(movieBorrow)!,
        );
        break;

      case 9:
        borrowRepo.listBorrow();
        break;

      case 0:
        rodando = false;
        break;

      default:
        print('Entrada Invalida');
    }
  }
}
