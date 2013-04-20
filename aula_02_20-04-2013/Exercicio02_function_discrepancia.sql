/*
Criar uma função que receba o código de um funcionário e mostre seu salário, 
a média do salário de seu departamento e retorne a discrepância (diferênça entre seu salário em relação a média)
*/

set serveroutput on
/
select vl_sal from func where cd_mat = :mat
/
select avg(vl_sal) from func where cd_depto = (select cd_depto from func where cd_mat = :mat)
/
create or replace function discrepancia_sal(mat_f in number)
return varchar2 is
  vl_discrepancia number;
  val_sal number;
  val_media number;
  msg_ret varchar2(500);
begin
  select vl_sal into val_sal from func where cd_mat = mat_f;
  select avg(vl_sal) into val_media from func where cd_depto = (select cd_depto from func where cd_mat = mat_f);
  vl_discrepancia :=  val_sal - val_media;
  
  if vl_discrepancia = val_media then
    msg_ret := 'Valor do salario igual a media: media'||val_media||' salario: '||val_sal||' discrepancia: '|| vl_discrepancia;
  elsif vl_discrepancia < val_media then
    msg_ret := 'Valor do salario menor que a media: media'||val_media||' salario: '||val_sal||' discrepancia: '|| vl_discrepancia;
  else
    msg_ret := 'Valor do salario maior que a media: media'||val_media||' salario: '||val_sal||' discrepancia: '|| vl_discrepancia;
  end if;
  
  return (msg_ret);
end;
/
declare
  vmat func.cd_mat%type := &mat;
  discr varchar2(2500);
begin
  discr := discrepancia_sal(vmat);
  dbms_output.put_line('teste');
  DBMS_OUTPUT.PUT_LINE(discr); 
end;
/
cd_mat = 10
Resultado:
Valor do salario menor que a media: media4283.333333333333333333333333333333333333 salario: 5275 discrepancia: 991.666666666666666666666666666666666667
