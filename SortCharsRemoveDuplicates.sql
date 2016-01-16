--Create a function to receive a string and return the string with alphabets arranged in ascending order.

CREATE TEMPORARY TABLESPACE tbs_t1 
    TEMPFILE 'tbs_t1.f' SIZE 50m REUSE AUTOEXTEND ON
    MAXSIZE UNLIMITED
    EXTENT MANAGEMENT LOCAL UNIFORM SIZE 64K;
create global temporary table mytable (charval varchar2(1)) on commit delete rows tablespace tbs_t1;

declare
sStrInput varchar2(50);
sStrCursor varchar2(1);
sStrOutput varchar2(100);
cursor cur is select distinct(charval) from mytable order by charval;
begin
sStrInput := 'izabcgrrss';
sStrOutput := '';
sStrCursor := '';
delete from mytable where 1=1;
for i in 1..length(sStrInput)
  loop
      insert into mytable values(substr(sStrInput, i,1)); 
  end loop;
open cur;
  loop
  fetch cur into sStrCursor ; 
    exit when cur%NOTFOUND;
    dbms_output.put_line('sStrCursor is' || sStrCursor);
    sStrOutput := sStrOutput || sStrCursor;  
  end loop;
  dbms_output.put_line(sStrOutput);
  end;





















