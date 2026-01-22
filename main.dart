import 'dart:io';
import 'models/classes.dart';
import 'func/funcoes.dart';
import 'data/repositories.dart';
import 'data/menus.dart';

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
    initialMenu();
    final int input = int.parse(stdin.readLineSync()!);

    switch (input) {
      case 1:
        clientMenu(bloqueados);
        final int input = int.parse(stdin.readLineSync()!);
        switch (input) {
          case 1:
            print('Qual o nome do cliente?');
            String nome = stdin.readLineSync()!;
            print('Qual o CPF do cliente?');
            String cpf = stdin.readLineSync()!;

            createClient(
              repository: clientRepo,
              id: id_cliente,
              nome: nome,
              cpf: cpf,
            );

            id_cliente++;

            break;

          case 2:
            clientRepo.listClients();
            break;

          case 3:
            print('Qual o código do cliente a ser bloqueado?');
            int codeBlock = int.parse(stdin.readLineSync()!);

            blockClient(clientRepo.findByCode(codeBlock)!);
            bloqueados++;
            break;

          case 4:
            if (bloqueados > 0) {
              print('Qual o código do cliente a ser desbloqueado?');
              int codeUnblock = int.parse(stdin.readLineSync()!);

              unblockClient(clientRepo.findByCode(codeUnblock)!);
              bloqueados--;
            } else {
              print('Opção inválida. Tente novamente.');
            }

            break;

          case 0:
            break;

          default:
            print('Opção inválida. Tente novamente.');
        }

        break;

      case 2:
        movieMenu();
        int movieInput = int.parse(stdin.readLineSync()!);

        switch (movieInput) {
          case 1:
            print('Qual o título do filme?');
            String title = stdin.readLineSync()!;
            print('Qual o gênero do filme?');
            String genre = stdin.readLineSync()!;

            createMovie(
              repository: movieRepo,
              id: id_filme,
              title: title,
              category: genre,
            );

            id_filme++;

            break;

          case 2:
            movieRepo.listMovies();
            break;

          case 3:
            print('Qual o código do filme a ser verificado?');
            int codeCheck = int.parse(stdin.readLineSync()!);
            Movie? movieToCheck = movieRepo.findByCode(codeCheck);
            if (movieToCheck != null) {
              movieToCheck.avaliable
                  ? print('Este filme está disponível')
                  : print('Este filme não está disponível');
            } else {
              print('Filme não encontrado.');
            }

            break;

          case 0:
            break;

          default:
            print('Opção inválida. Tente novamente.');
        }

        break;

      case 3:
        borrowMenu();
        int input = int.parse(stdin.readLineSync()!);

        switch (input) {
          case 1:
            print('Qual o código do cliente?');
            int clientCode = int.parse(stdin.readLineSync()!);
            Client? clientBorrow = clientRepo.findByCode(clientCode);

            print('Qual o código do filme?');
            int movieCode = int.parse(stdin.readLineSync()!);
            Movie? movieBorrow = movieRepo.findByCode(movieCode);

            if (clientBorrow != null && movieBorrow != null) {
              makeBorrow(
                repository: borrowRepo,
                c: clientBorrow,
                m: movieBorrow,
              );
            } else {
              print('Cliente ou filme não encontrado.');
            }

            break;

          case 2:
            borrowRepo.listBorrow();
            break;

          case 0:
            break;

          default:
            print('Opção inválida. Tente novamente.');
        }

        break;

      case 0:
        rodando = false;
        print('Saindo do sistema. Até mais!');
        break;

      default:
        print('Opção inválida. Tente novamente.');
    }
  }
}
