/*
Fazer uma procedure que leia todos os empregados e chame
outra procedure que retorne a quantidade de dias  que  cada
empregado trabalha na empresa.
Mostre na tela: código, nome e quantidade de dias.
OBS.: Ordenar os empregados por departamento.
*/
/
create or replace procedure calcula_dias(
  p_data in date, 
  p_qtde_dias out number
) is
begin
  p_qtde_dias := sysdate - p_data;
end;
/
create or replace procedure ler_emp is
  cursor c1 is 
     select * from func order by cd_depto; 
  v_func func%rowtype;
  qtde_dias number(6,2);
  begin
     open c1;
        loop
           fetch c1 into v_func;
           exit when c1%notfound;
           calcula_dias(v_func.dt_adm,qtde_dias);
           dbms_output.put_line('Código: '||v_func.cd_mat||' Nome: '||rpad(v_func.nm_func,6,' ')||
 				' Qtde dias: '||qtde_dias);
        end loop;
     close c1;
  end;
/
begin
  ler_emp;
end;
/
Resultado:
Código: 110 Nome: VICENT Qtde dias: 6914.66
Código: 10 Nome: CRISTI Qtde dias: 6684.66
Código: 120 Nome: SILVIO Qtde dias: 7076.66
Código: 20 Nome: MIGUEL Qtde dias: 7132.66
Código: 30 Nome: SANDRA Qtde dias: 6590.66
Código: 140 Nome: HELENA Qtde dias: 7797.66
Código: 130 Nome: DOLORE Qtde dias: 7937.66
Código: 60 Nome: IRACY  Qtde dias: 7158.66
Código: 180 Nome: MARIA  Qtde dias: 8323.66
Código: 220 Nome: JOANA  Qtde dias: 6444.66
Código: 210 Nome: WILIAM Qtde dias: 6949.66
Código: 200 Nome: DAVI   Qtde dias: 6257.66
Código: 190 Nome: JAIRO  Qtde dias: 6478.66
Código: 170 Nome: GABRIE Qtde dias: 8618.66
Código: 160 Nome: ELIZAB Qtde dias: 7404.66
Código: 150 Nome: BRUNO  Qtde dias: 7738.66
Código: 260 Nome: SILVIA Qtde dias: 6431.66
Código: 70 Nome: EVA    Qtde dias: 8238.66
Código: 2107 Nome: MARTA  Qtde dias: 8238.66
Código: 230 Nome: JOAQUI Qtde dias: 6360.66
Código: 240 Nome: SALVAD Qtde dias: 7076.66
Código: 250 Nome: DANIEL Qtde dias: 4921.66
Código: 50 Nome: JOAO   Qtde dias: 8647.66
Código: 300 Nome: FELIPE Qtde dias: 7610.66
Código: 310 Nome: MARINA Qtde dias: 7891.66
Código: 90 Nome: ELIANE Qtde dias: 6458.66
Código: 280 Nome: ELINE  Qtde dias: 8063.66
Código: 290 Nome: JOAO   Qtde dias: 8361.66
Código: 330 Nome: WILSON Qtde dias: 6266.66
Código: 100 Nome: TEODOR Qtde dias: 8344.66
Código: 320 Nome: ROBERT Qtde dias: 8323.66
Código: 340 Nome: DILSON Qtde dias: 6194.66
