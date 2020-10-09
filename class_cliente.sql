create or replace type class_cliente as object(
  nome      varchar2(255),
  cpf       varchar2(11),
  profissao varchar2(255)
);