Create table curso (nom_curso varchar2(50) , 
            carga_horaria number(4), 
            carga_horaria_ant number(4));
            
insert into curso values('Engenharia de Software',400,null);
insert into curso values('Ciência da Computação',300,null);

update curso 
set carga_horaria = 420 
where nom_curso = 'Engenharia de Software';

select * from curso;

alter trigger t_curso disable;