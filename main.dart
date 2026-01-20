import 'models/classes.dart';
import 'func/funcoes.dart';

void main() {
  Client c1 = Client(
    name: 'John', 
    cpf: '123.456.789-99', 
    code: 1
    );

  Movie m1 = Movie(
    category: 'Horror', 
    title: 'IT - A coisa'
    );

  movieCheck(m1);
  makeBorrow(c1, m1);
  makeBorrow(c1, m1);
  m1.movieBack();
  movieCheck(m1);
}