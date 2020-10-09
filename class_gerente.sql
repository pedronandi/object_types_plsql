/*
  under = Herança simples = Gerente herda características (atributos) e comportamentos (métodos) de Funcionario
  autentica_util =
    Possui um atributo de senha e um método pra validar a senha
    Como o acesso é direto (autenticador.senha / autenticador.autentica), não precisa reescrever nada
  overriding = Reescrita = Gerente está reescrevendo o método get_bonificacao do class_funcionario
*/
create or replace type class_gerente under class_funcionario(
  autenticador autentica_util,
  
  overriding member function get_bonificacao(self in out class_gerente) return number
);
create or replace type body class_gerente as
  overriding member function get_bonificacao(self in out class_gerente) return number as
  begin
    dbms_output.put_line('get_bonificacao do Gerente');

    return self.salario;
  end;
end;