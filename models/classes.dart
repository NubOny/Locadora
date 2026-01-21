class Person {
  String name;
  String cpf;

  Person({required this.name, required this.cpf});

  void showData() {
    print("""
    Nome: ${name}
    cpf: ${cpf}
    """);
  }
}

class Client extends Person {
  int code;
  bool _active = true;
  bool get active => _active;

  Client({required String name, required String cpf, required this.code})
    : super(name: name, cpf: cpf);

  void activate() {
    _active = true;
    print('Cliente ativado');
  }

  void deactivate() {
    _active = false;
    print('Cliente desativado');
  }

  @override
  void showData() {
    print("""
    Nome: ${name}
    Code: ${code}
    """);
  }
}

class Movie {
  String title;
  String category;
  int code;
  bool _avaliable = true;
  bool get avaliable => _avaliable;

  Movie({required this.category, required this.title, required this.code});

  void showInfo() {
    print("""
    Titulo: ${title}
    categoria: ${category}
    Codigo: ${code}
    """);
  }

  void checkAvaliable() {
    if (avaliable) {
      print('Este filme está disponível');
    } else {
      print('Este filme está indisponível');
    }
  }

  void borrow() {
    _avaliable = false;
    print('O filme foi alugado');
  }

  void movieBack() {
    _avaliable = true;
    print('O livro foi devolvido');
  }
}

class Borrow {
  Client c;
  Movie m;
  bool _active = true;
  bool get active => _active;

  Borrow({required this.c, required this.m});

  void detail() {
    print("""
    Cliente: ${c.name}
    Filme: ${m.title}
    Situação do filme: ${m.avaliable}
    """);
  }
}
