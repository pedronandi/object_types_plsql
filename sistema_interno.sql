create or replace type sistema_interno as object(
  senha number,
  
  member procedure autentica(a in out autentica_util)
);
create or replace type body sistema_interno as
  member procedure autentica(a in out autentica_util) as
    autenticou boolean;
  begin
    self.senha := 2222;
    autenticou := a.autentica(self.senha);
    
    if autenticou then
      dbms_output.put_line('Pode entrar no sistema!');
    else
      dbms_output.put_line('Não pode entrar no sistema!');
    end if;
  end;
end;