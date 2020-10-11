/*
  Teste de polimorfismo:
    O método registra recebe um objeto class_funcionario
    De acordo com a herança simples e o overriding, poderia ser um class_gerente ou class_administrador
*/
create or replace type controle_bonificacao as object(
  soma number,
  
  member procedure registra(func in out class_funcionario)
);
create or replace type body controle_bonificacao as
  member procedure registra(func in out class_funcionario) as
    boni number;
  begin
    boni := func.get_bonificacao;
    self.soma := (self.soma + boni);
  end;
end;