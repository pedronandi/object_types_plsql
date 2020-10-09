create or replace type class_administrador under class_funcionario(
  autenticador autentica_util,
  
  overriding member function get_bonificacao(self in out class_administrador) return number
);
create or replace type body class_administrador as
  overriding member function get_bonificacao(self in out class_administrador) return number as
  begin
    dbms_output.put_line('get_bonificacao do Administrador');

    return 50;
  end;
end;