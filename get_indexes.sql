/*
use sqlopsdb
sp_helpindex purchaseorderbase

create index testind on purchaseorderbase(directcustomerkey)
 include
(purchaseordertypecode,
endcustomerpcn)
PurchaseOrderTypeCode
EndCustomerPCN

select po.endcustomerpcn , purchaseordertypecode from warehouse..purchaseorder po 
inner hash join warehouse..salesorderlineitem sli on
po.purchaseorderkey = sli.salesorderlineitemid
where po.purchaseordertypename = 'New Order'


select po.endcustomerpcn , purchaseordertypecode from warehouse..purchaseorder po 
inner hash join warehouse..salesorderlineitem sli on
po.purchaseorderkey = sli.salesorderlineitemid
where po.DirectCustomerKey = 'New Order'

select * from warehouse..sysobjects

*/

CREATE procedure get_indexes as
set nocount on
/*if  exists (select * from tempdb..sysobjects where name like '%indexlist%')
drop table #indexlist*/
create table #indexlist (id int identity,index_name varchar(2000),column_name varchar(2000),table_name varchar(2000))

if exists (select * from tempdb..sysobjects where name like '%indexname%')
drop table #indexname
create table #indexname (index_name varchar(2000), column_name varchar(2000), table_name varchar(2000))

if exists (select * from tempdb..sysobjects where name like '%clustercol%')
drop table #clustercol
create table #clustercol (column_name varchar(2000), table_name varchar(2000))

insert into #indexlist 
SELECT i.name AS index_name
    ,c.name AS column_name
	,so.name as table_name
FROM warehouse.sys.indexes AS i
INNER JOIN warehouse.sys.index_columns AS ic 
    ON i.object_id = ic.object_id AND i.index_id = ic.index_id
INNER JOIN warehouse.sys.syscolumns c
    ON c.colid = ic.column_id and c.id = i.object_id
	--and i.name = 'MSL_SalesOrderLineItemBase_InvoiceKey_Inc'
INNER JOIN warehouse..sysobjects so on
so.id = c.id
	order by ic.index_column_id



insert into #clustercol
SELECT c.name AS column_name
	,so.name as table_name
FROM warehouse.sys.indexes AS i
INNER JOIN warehouse.sys.index_columns AS ic 
    ON i.object_id = ic.object_id AND i.index_id = ic.index_id
INNER JOIN warehouse.sys.syscolumns c
    ON c.colid = ic.column_id and c.id = i.object_id
	--and i.name = 'MSL_SalesOrderLineItemBase_InvoiceKey_Inc'
INNER JOIN warehouse..sysobjects so on
so.id = c.id
where i.index_id=1
	order by ic.index_column_id

delete f from filterlist f 
join #clustercol c on 
f.tablename=c.table_name and f.columnname=c.column_name

delete o from outputlist o 
join #clustercol c on 
o.tablename=c.table_name and o.columnname=c.column_name




create table #lead_columns (id int,index_name varchar(2000),column_name varchar(2000),table_name varchar(2000))
insert into #lead_columns select min(id),index_name,null,table_name
from #indexlist
group by index_name,table_name

update lc  set column_name = il.column_name
from #lead_columns lc
join #indexlist il on lc.id = il.id

insert into #indexname select distinct  c1.index_name, column_name, c1.table_name from
#lead_columns c1 join filterlist f1
on f1.columnname = c1.column_name and f1.tablename = c1.table_name




declare @index_name varchar(2000), @column_name varchar(2000), @table_name varchar(2000)

while exists (select * from #indexname)
begin
set rowcount 1
select @index_name = index_name, @column_name = column_name, @table_name = table_name from #indexname
set rowcount 0

if not exists (select * from filterlist where tablename = @table_name and
                   columnname not in(select column_name from #indexlist where index_name = @index_name and table_name = @table_name) )
and not exists (select * from outputlist where tablename = @table_name and
                   columnname not in(select column_name from #indexlist where index_name = @index_name  and table_name = @table_name) )

begin
    select @index_name, @column_name
	delete from #indexname where column_name = @column_name and table_name =@table_name

end
else
begin
    delete from #indexname where index_name = @index_name

end

end