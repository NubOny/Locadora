void initialMenu() {
  print("""
    1 - Menu do Cliente
    2 - Menu de Filmes
    3 - Menu de Empréstimos
    0 - Sair
    """);
}

void clientMenu(bloqueados) {
  if (bloqueados > 0) {
  print("""
  1 - Cadastrar novo cliente
  2 - Mostrar todos os clientes ativos
  3 - Bloquear cliente
  4 - Desbloquear cliente
  0 - Voltar
  """);
  }

  else {
  print("""
  1 - Cadastrar novo cliente
  2 - Mostrar todos os clientes ativos
  3 - Bloquear cliente
  0 - Voltar
  """);
  }
}

void movieMenu() {
  print("""
  1 - Cadastrar Filme
  2 - Listar Filmes
  3 - Verificar disponibilidade de filme
  0 - Voltar
  """);
}

void borrowMenu() {
  print("""
  1 - Fazer novo Emprestimo
  2 - Verificar Emprestimos Ativos
  0 - Voltar
  """);
}
