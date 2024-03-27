set serveroutput on
begin
    dbms_output.put_line('hello' || 'world');
end;


set serveroutput on
declare
    v_string varchar2 (100) := 'Hello world + 2';
begin
    dbms_output.put_line(v_string);
exception
    when others
        then
            dbms_output.put_line(sqlerrm);
end;

select * from message_table;

set serveroutput on
declare
    v_string varchar2(100) := 'hello';
begin
    declare
        v_string2 varchar2(100) := v_string || ' world2';
    begin
        dbms_output.put_line(v_string2);
    end;
exception
    when others then
        dbms_output.put_line(dbms_utility.format_error_stack);
end;


create or replace procedure hello_word
is
v_string varchar2(100) := 'Hello world';
begin
    dbms_output.put_line(v_string);
exception
    when others then
        dbms_output.put_line(sqlerrm);
end hello_word;

set serveroutput on
begin
    hello_word;
end;

create or replace procedure hello_place (place_input in varchar2) is
    v_string varchar2(100) := 'Hello ' || place_input;
begin
    dbms_output.put_line(v_string);
end hello_place;

set serveroutput on
begin
    hello_place('ola');
end;

create or replace function fkg_hello_place (place_input in varchar2)
return varchar2
is
begin
    return 'hello ' || place_input;
end fkg_hello_place;

set serveroutput on
declare
    v_string varchar2(100);
begin
    v_string := fkg_hello_place('mundo2');
    dbms_output.put_line(v_string);
end;

create table message_table (
    id number(4),
    name varchar2(30)
    );

begin
    insert into message_table values (1, fkg_hello_place('teste24'));
end;

set serveroutput on
declare
    v_nome message_table.name%TYPE;
begin
    select name into v_nome
    from message_table;
    dbms_output.put_line(v_nome);
end;

declare
    v_id message_table.id%TYPE := 1;
begin
    delete from message_table
    where id = v_id;

    commit;
end;

begin
    insert into message_table (id, name)
    values (2, 'bom dia');

    dbms_output.put_line(sql%rowcount);

    commit;
end;

select * from message_table;

set serveroutput on
declare
cursor c_test is
    select * from message_table;
begin
    for a in c_test loop
        dbms_output.put_line(a.name ||' ' || a.id);
    end loop;
end;

set serveroutput on
declare
    v_id message_table.id%type;
begin
    if (v_id = 1) then
        dbms_output.put_line('entrou');
    else
        dbms_output.put_line('else');
    end if;
end;

set serveroutput on
declare
    v_string1 varchar2(10) := 'Logic';
    v_string2 char(10) := 'Logic';
begin
    if (v_string1 = v_string2) then
        dbms_output.put_line('Equal');
    else
        dbms_output.put_line('Not equal');
    end if;
end;

set serveroutput on
DECLARE
   l_company_name   VARCHAR2 (6) := 'Oracle';
BEGIN
   /* Retrieve the last character in the string */
   DBMS_OUTPUT.put_line (SUBSTR (l_company_name, -3, 3));
END;

BEGIN
 /* Find the location of the first "e" */
  DBMS_OUTPUT.PUT_LINE ( INSTR ('steven feuerstein', 'e'));
 /* Find the location of the first "e" starting from position 6 */
  DBMS_OUTPUT.PUT_LINE ( INSTR ('steven feuerstein', 'e', 6));
 /* Find the location of the first "e" starting from the 6th position from
      the end of string and counting to the left. */
  DBMS_OUTPUT.PUT_LINE ( INSTR ('steven feuerstein', 'e', -6));
 /* Find the location of the 3rd "e" starting from the 6th position from
      the end of string. */
  DBMS_OUTPUT.PUT_LINE ( INSTR ('steven feuerstein', 'e', -6, 3));
END;


set serveroutput on
declare
    v_string varchar2(10) := 'test';
begin
    if (INSTR(v_string, 'e') > 0) then
        dbms_output.put_line('entrou ' || INSTR(v_string, 't')+1);
    end if;
end;


create or replace procedure teste(name in message_table.name%type) is
v_string varchar2(20);
cursor c_test is
select * from message_table;
begin
    dbms_output.put_line(v_string || ' ' || name);
    for test in c_test loop
        dbms_output.put_line(test.name);
        execute immediate 'insert into message_table values (3, :var1 ||'' modificado'')' using test.name;
    end loop;
end teste;

set serveroutput on
begin
    teste('ata');
end;

select * from message_table;
delete from message_table
where id > 2;

BEGIN
  DBMS_OUTPUT.put_line (
     TO_CHAR (SYSDATE,
'FMDay, DDth Month YYYY'));
END;

begin
    dbms_output.put_line(to_char(sysdate, 'DD/MM/YYYY'));
end;

set serveroutput on
declare
    e_teste exception;
begin
    if (1 < 2) then
        raise e_teste;
    end if;

    exception when e_teste then
        dbms_output.put_line('erro exception ');
end;