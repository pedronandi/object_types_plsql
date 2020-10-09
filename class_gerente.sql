/*
  under = Heran�a simples = Gerente herda caracter�sticas (atributos) e comportamentos (m�todos) de Funcionario
  autentica_util =
    Possui um atributo de senha e um m�todo pra validar a senha
    Como o acesso � direto (autenticador.senha / autenticador.autentica), n�o precisa reescrever nada
  overriding = Reescrita = Gerente est� reescrevendo o m�todo get_bonificacao do class_funcionario
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