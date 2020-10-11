declare
  nico              class_gerente;
  autenticadorNico  autentica_util;
  pedro             class_Administrador;
  autenticadorPedro autentica_util;
  controle          controle_bonificacao;
begin
  autenticadorNico  := new autentica_util(123456);
  nico              := new class_gerente('Nico Steppat', '12345678910', 2600, autenticadorNico);
  autenticadorPedro := new autentica_util(555555);
  pedro             := new class_administrador('Pedro Nandi', '07954307956', 6000, autenticadorPedro);

  controle.registra(nico);
  controle.registra(pedro);

  dbms_output.put_line(controle.soma);
exception
  when others then
    raise_application_error(-20000, trim(sqlerrm));
end;