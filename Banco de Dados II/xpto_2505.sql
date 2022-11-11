select*from carg;

select count(*) from func f;

select a.codigo_dpto, d.nome_dpto, count(*) qtde
from aloc a
inner join dpto d on d.codigo_dpto = a.codigo_dpto
group by a.codigo_dpto;

select a.codigo_dpto, d.nome_dpto, count(*) qtde
from aloc a
left join dpto d on d.codigo_dpto = a.codigo_dpto
group by a.codigo_dpto;

select f.codigo_carg, count(*) qtde
from func f 
group by f.codigo_carg;

insert into carg values ('OP2', 'Operador 2', 'T', 'M', 900, 1300, 'N');

select c.codigo_carg, c.nome_carg from carg c where c.codigo_carg
not in 
(select distinct f.codigo_carg from func f);

select d.codigo_dpto, d.nome_dpto, f.nome_func
from dpto d left join func f on f.numero_func = d.numero_gerente; 