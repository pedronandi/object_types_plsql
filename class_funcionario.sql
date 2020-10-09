/*
  not instantiable = Classe abstrata = Não pode ser instanciada por um objeto
  not final = Super classe
*/

create or replace type class_funcionario as object(
  nome    varchar2(255),
  cpf     varchar2(11),
  salario number(10,2),
  
  /* not instantiable = Método abstrato = Só pode ser implementado pelas subtypes */
  not instantiable member function get_bonificacao(self in out class_funcionario) return number  
) not instantiable not final;
