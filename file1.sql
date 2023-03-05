declare
cursor c1 is select * from employees is;
v_rec employees.salary%type;
brgin
open c1;
loop
fetch c1 into v_rec;
exit when c1%notfound;
dbms_out.put_line(v_rec.salary);
end loop;
close c1;
end;

===========================================================================

declare
 type location_type is table of locations.city%type;
 offices location_type;
 begin
 offices:=location_type('bomby','tokyo','singapore','oxford');
 dbms_output.put_line(offices.count);
 offices.extend;
 offices(offices.last):='hyd';
 dbms_output.put_line(offices.count);
 dbms_output.put_line(offices(1));
  offices.extend;
 dbms_output.put_line(offices(6));
 end;
=============================================================================

declare
TYPE city_type is table of locations.city%type;
v_name city_type;
begin
v_name:=city_type('hyd','mum','kol');
dbms_output.put_line(v_name(1));
dbms_output.put_line(v_name(2));
dbms_output.put_line(v_name(3));
end;



====================================================================

declare
TYPE city_type is table of locations.city%type;
v_name city_type;
begin
v_name:=city_type('hyd','mum','kol');
dbms_output.put_line(v_name(1));
dbms_output.put_line(v_name(2));
dbms_output.put_line(v_name(3));
v_name.delete(2);
end;
===================================================
declare
TYPE city_type is table of varchar2(30);
v_name city_type;
begin
v_name:=city_type();
v_name.extend;
v_name(v_name.last):='hyd';
v_name.extend;
v_name(v_name.last):='mum';
v_name.extend;
v_name(v_name.last):='kol';
for i in 1..v_names.count loop
d



end;
=============================================
declare
v_countryid countries.country_id%type :='CA';
v_country_record countries%ROWTYPE;
begin
select * into v_country_record from countries where country_id=v_countryid;
dbms_output.put_line(v_countryid);
end;    

==============================================================================
declare
type dept_table_type is table of departments.department_name%type index by pls_integer;
my_dept_table dept_table_type;
loop_count number:=10;
deptno number:=0;
l_next number;
begin
loop
deptno:=depno+10;
select department_name into my_dept_table_type(deptno) from departments where department_id=deptno;
exit when loop_count=0;
loop_count:=loop_count-1;
end loop;
end;
loop
l_next:=my_dept_table
dbms_output.put_line()
end loop;




==================================================================================
declare
type dept_table_type is table of departments%rowtype index by pls_integer;
my_dept_table dept_table_type;
cursor c1 is slect * from departments;

l_next number;

BEGIN
open c1
LOOP

end loop;
===============================================================================




declare
cursor dept_cursor is select department_id,department_name from departments where department_id<100
order by department_id;
cursor emp_cursor(v_deptno NUMBER) is select employee_id,last_name,job_id,hire_date,salary,department_id from employees
where employee_id<120 and department_id=v_deptno ;
v_rec_dept dept_cursor%rowtype;
v_rec_emp emp_cursor%rowtype;
begin
open dept_cursor; 
loop
fetch dept_cursor into v_rec_dept;
exit when dept_cursor%notfound;
dbms_output.put_line(v_rec_dept.department_id||' '||v_rec_dept.department_name);
open emp_cursor(10);
loop
fetch emp_cursor into v_rec_emp;
exit when emp_cursor%notfound;
dbms_output.put_line(v_rec_emp.last_name||' '||v_rec_emp.job_id||' '||v_rec_emp.hire_date||' '||v_rec_emp.salary);
end loop;
end loop;
if dept_cursor%isopen then
close dept_cursor;
end if;
if emp_cursor%isopen then
close emp_cursor;
end if;
end;


==========================================================================
top 5 salaries by using cursor
declare
v_num NUMBER:=5;
v_sal employees.salary%type;
cursor c_emp_cursor is select salary from employees
order by salary desc;
begin
open c_emp_cursor;
loop
fetch c_emp_cursor into v_sal;

exit when c_emp_cursor%rowcount>v_num;

dbms_output.put_line(v_sal);

end loop;
close c_emp_cursor;
end;
================================================================


declare
v_deptno number:=10;
cursor c_emp_cursor is select last_name,salary,manager_id from employees
where department_id=v_deptno;
v_rec c_emp_cursor%rowtype;
begin
open c_emp_cursor;
loop
fetch c_emp_cursor into v_rec;
exit when c_emp_cursor%notfound;
if v_rec.salary<5000 and v_rec.manager_id in (101,124) then
dbms_output.put_line(v_rec.last_name||' '||'due for a raise');
else
dbms_output.put_line(v_rec.last_name||' '||'not due for a raise');
end if;
end loop;
close c_emp_cursor;
end;

======================================================================== 

declare
v_rec employees%rowtype;
begin
select * into v_rec from employees where employee_id=5000;
update employees set salary=salary+1000
where employee_id=v_rec.employee_id;
exception
when no_data_found then
dbms_output.put_line('no epmloyee found');
dbms_output.put_line('exception name:'||SQLCODE);


end;
=========================================================
declare 
v_basic_percent NUMBER :=45;
v_pf_percent NUMBER:=12;
v_fname VARCHAR2(15);
v_emp_sal NUMBER(10);
begin
select first_name,salary into v_fname,v_emp_sal from employees where employee_id=110;
dbms_output.put_line('hello'||' '||v_fname);
v_basic_percent:=(45/100)*(v_emp_sal);
v_pf_percent:=(12/100)*v_basic_percent;
dbms_output.put_line('your salary is:'||v_emp_sal);
dbms_output.put_line('your contribution towards pf:'||v_pf_percent);
end;

======================================================================