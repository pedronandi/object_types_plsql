declare
  nico         class_gerente;
  autenticador autentica_util;
  autenticou   boolean;
begin
  autenticador := new autentica_util(123456);
  nico         := new class_gerente('Nico Steppat', '12345678910', 2600, autenticador);

  dbms_output.put_line('Nome: ' || nico.nome);
  dbms_output.put_line('CPF: ' || nico.cpf);
  dbms_output.put_line('Salário: ' || nico.salario);
  dbms_output.put_line('getBonificacao: ' || nico.get_bonificacao);
  
  autenticou := autenticador.autentica(123456);
  
  if autenticou then
    dbms_output.put_line('Autenticou!');
  end if;
  
  dbms_output.put_line('getBonificacao: ' || nico.get_bonificacao);
exception
  when others then
    raise_application_error(-20000, trim(sqlerrm));
end;
