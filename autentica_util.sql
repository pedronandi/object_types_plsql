create or replace type autentica_util as object(
  senha number,
  
  member function autentica(self in out autentica_util, senha number) return boolean
);
/
create or replace type body autentica_util as
  member function autentica(self in out autentica_util, senha number) return boolean as
  begin
    if self.senha = senha then
      return true;
    else
      return false;
    end if;
  end;
end;