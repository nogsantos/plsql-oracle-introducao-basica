/*
Criar um procedimento que gere um relatório que apresente o cod_emp, nome_emp e
salario_ant_emp e salario_novo_emp da tabela func. Sendo que os salários que
forem menor que 1400 receberão 30% de reajuste. Entre 1401 a 1700 receberão 25%
e acima de 1701 receberão 20% para um determinado empregado.
*/
/
create or replace procedure reajuste_salarial_emp (
  incodemp in func.cd_mat%type
) is
  vcodemp func.cd_mat%type;
  vnomeemp varchar2(1500);
  vsalarioanterior func.vl_sal%type;
  vsalarionovo func.vl_sal%type;
  cursor cursoremp is
    select 
      cd_mat,
      nm_func ||' '|| nm_sobrenome nome,
      vl_sal salarioanterior,
      case
        when vl_sal < 1400 then vl_sal * 1.30
        when (vl_sal > 1401 and vl_sal < 1700) then vl_sal * 1.25
        when vl_sal > 1701 then vl_sal * 1.20
      else vl_sal
      end salarionovo
    from func
    where cd_mat = incodemp;
begin
    open cursoremp;
    loop
      fetch cursoremp into vcodemp, vnomeemp, vsalarioanterior, vsalarionovo;
        exit when cursoremp%notfound;
    dbms_output.put_line('Codigo: '||vcodemp||' Nome: '||vnomeemp||' SalarioAnterior: '||vsalarioanterior||' SalarioNovo: '||vsalarionovo); 
    end loop;
    close cursoremp;  
end reajuste_salarial_emp;
/
begin
  reajuste_salarial_emp(10);
end;