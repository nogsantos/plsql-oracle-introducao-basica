DECLARE
  WVARCHAR       VARCHAR2(20);
  WVARCHAR2      VARCHAR2(20) := '05/02/87';
  WDATE          DATE;
  WDATE2         DATE;
BEGIN
  WDATE     := TO_DATE('01111987', 'DDMMYYYY');
  WVARCHAR  := WDATE;
  WDATE2    := WVARCHAR2;
  :P1       := WVARCHAR||' - '||TO_CHAR(WDATE2, 'DDMMYYYY');
END;