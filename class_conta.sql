create or replace type class_conta as object(
  saldo   number,
  agencia number,
  numero  number,
  titular class_cliente,
  
  constructor function class_conta(agencia number, numero varchar2) return self as result,
  member procedure deposita(valor number),
  member function saca(self in out class_conta, valor number) return boolean,
  member procedure transfere(valor number, destino in out class_conta, status out boolean)
);
/
create or replace type body class_conta as 
  constructor function class_conta(agencia number, numero varchar2) return self as result as
  begin
    if agencia > 0 then
      self.agencia := agencia;
    else
      raise_application_error(-20000, 'O valor da agência não pode ser negativo!');
    end if;
    
    if numero > 0 then
      self.numero := numero;
    else
      raise_application_error(-20000, 'O valor do número não pode ser negativo!');
    end if;
    
    self.saldo := 0;
    
    dbms_output.put_line('Estou criando uma conta ' || self.numero);
    
    return;
  end;
  
  /* Como é uma procedure, não precisa passar o objeto como parâmetro */
  member procedure deposita(valor number) as
  begin
    self.saldo := (self.saldo + valor);
  end;
  
  /* Função precisa do objeto como parâmetro se ocorrer uma mudança no estado */
  member function saca(self in out class_conta, valor number) return boolean as
  begin
    if self.saldo >= valor then
      self.saldo := (self.saldo - valor);

      return true;
    else
      return false;
    end if;
  end;
  
  member procedure transfere(valor number, destino in out class_conta, status out boolean) as
  begin
    if self.saca(valor) then
      destino.deposita(valor);

      status := true;
    else
      status := false;
    end if;
  end;
end;