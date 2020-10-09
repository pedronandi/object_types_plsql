declare
  conta class_conta;
begin
  conta := new class_conta(2232, 37431);

  dbms_output.put_line('Agencia: ' || conta.agencia);
  dbms_output.put_line('Numero: ' || conta.numero);

  conta.titular := new class_cliente('Pedro Nandi', '07954307956', 'Desenvolvedor Back-End');

  dbms_output.put_line('Titular: ' || conta.titular.nome);
  dbms_output.put_line('CPF: ' || conta.titular.cpf);
  dbms_output.put_line('Profissão: ' || conta.titular.profissao);

  dbms_output.put_line('Saldo original: ' || conta.saldo);

  if conta.saca(50) then
    conta.deposita(100);
  else
    raise_application_error(-20000, 'Valor do saque não autorizado!');
  end if;

  dbms_output.put_line('Saldo final: ' || conta.saldo);
exception
  when others then
    raise_application_error(-20000, trim(sqlerrm));
end;