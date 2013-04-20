/*
Criar uma procedure que mostre o numero, nome, data admissão
(formatar a data em dd/mm/yyyy) e o  nome  do  departamento  do
empregado 7369. Caso o salário seja  menor  do  que  R$1000,00,
conceder 20% de aumento. Caso seja maior ou igual  a  R$1000,00
e menor do que R$10000,00  conceder  15%  de  aumento.  Caso  o 
salário seja maior ou  igual  a  R$10000,00,  conceder  10%  de
aumento.
OBS.: Além de mostrar os dados acima, mostrar o salário antigo,
o percentual aplicado e o salário novo.
*/
create or replace procedure aumento_func (incdfunc in func.cd_mat%type) is
  vcdmat func.cd_mat%type;
  vnmfunc func.nm_func%type;
  vdtadm func.dt_adm%type;
  vvlsal func.vl_sal%type;
  vcddepto func.cd_depto%type; 
  vpercent  number(2);
  vdeptonome varchar2(250);
  begin
     select 
        f.cd_mat, 
        f.nm_func, 
        f.dt_adm, 
        f.vl_sal, 
        f.cd_depto,
        d.nm_depto
          into vcdmat, vnmfunc, vdtadm, vvlsal, vcddepto, vdeptonome
        from func f, depto d 
      where
      f.cd_depto = d.cd_depto
      and cd_mat = incdfunc;
     if vvlsal < 1000 then
        vpercent := 20;
     elsif vvlsal >= 1000 and vvlsal < 10000 then
        vpercent := 15;
     else
        vpercent := 10; 
     end if;     
     update func set vl_sal = vl_sal + (vl_sal * vpercent/100);
     dbms_output.put_line('Número: '||vcdmat||' Nome: '||vnmfunc||
                          ' Data Adm.: '||to_char(vdtadm,'dd/mm/yyyy')||
                          ' Nome Depto: '||vdeptonome||' Salário Ant. '||vvlsal||
                          ' Percentual: '||vpercent||'%'||
			  ' Salário Novo: '||(vvlsal+(vvlsal*vpercent)/100));
  end;
/
begin
  aumento_func(10);
end;
/
Resultado:
Número: 10 Nome: CRISTINA Data Adm.: 01/01/1995 Nome Depto: DIRETORIA DA EMPRESA Salário Ant. 5275 Percentual: 15% Salário Novo: 6066.25
