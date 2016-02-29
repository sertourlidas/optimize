/*
select * from queryxml
<ShowPlanXML xmlns=http://schemas.microsoft.com/sqlserver/2004/07/showplan Version=1.2 Build=11.0.3470.0><BatchSequence><Batch><Statements><StmtSimple StatementText=select po.endcustomerpcn , purchaseordertypecode from warehouse..purchaseorder po &#xd;&#x

a;inner hash join warehouse..salesorderlineitem sli on&#xd;&#xa;po.purchaseorderkey = sli.salesorderlineitemid&#xd;&#xa;where po.DirectCustomerKey = &apos;New Order&apos;&#xd;&#xa;&#xd;&#xa;--where po.purchaseorderkey = 18057906&#xd;&#xa;&#xd;&#xa;&#xd;&#

xa;&#xd;&#xa;&#xd;&#xa;&#xd;&#xa; StatementId=1 StatementCompId=1 StatementType=SELECT RetrievedFromCache=false StatementSubTreeCost=327.502 StatementEstRows=355.513 StatementOptmLevel=FULL QueryHash=0xD8A3175C75D8A10A QueryPlanHash=0x2B810172AFE82799><St

atementSetOptions QUOTED_IDENTIFIER=true ARITHABORT=false CONCAT_NULL_YIELDS_NULL=true ANSI_NULLS=true ANSI_PADDING=true ANSI_WARNINGS=true NUMERIC_ROUNDABORT=false/><QueryPlan CachedPlanSize=56 CompileTime=49 CompileCPU=49 CompileMemory=864><ThreadStat B

ranches=2/><MemoryGrantInfo SerialRequiredMemory=1024 SerialDesiredMemory=6888/><OptimizerHardwareDependentProperties EstimatedAvailableMemoryGrant=2013265 EstimatedPagesCached=8053062 EstimatedAvailableDegreeOfParallelism=3/><RelOp NodeId=0 PhysicalOp=Pa

rallelism LogicalOp=Gather Streams EstimateRows=355.513 EstimateIO=0 EstimateCPU=0.028861 AvgRowSize=21 EstimatedTotalSubtreeCost=327.502 Parallel=1 EstimateRebinds=0 EstimateRewinds=0 EstimatedExecutionMode=Row><OutputList><ColumnReference Database=[ware

house] Schema=[dbo] Table=[PurchaseOrderBase] Alias=[POB] Column=PurchaseOrderTypeCode/><ColumnReference Database=[warehouse] Schema=[dbo] Table=[PurchaseOrderBase] Alias=[POB] Column=EndCustomerPCN/></OutputList><Parallelism><RelOp NodeId=1 PhysicalOp=Ha

sh Match LogicalOp=Inner Join EstimateRows=355.513 EstimateIO=0 EstimateCPU=141.782 AvgRowSize=21 EstimatedTotalSubtreeCost=327.474 Parallel=1 EstimateRebinds=0 EstimateRewinds=0 EstimatedExecutionMode=Row><OutputList><ColumnReference Database=[warehouse]

 Schema=[dbo] Table=[PurchaseOrderBase] Alias=[POB] Column=PurchaseOrderTypeCode/><ColumnReference Database=[warehouse] Schema=[dbo] Table=[PurchaseOrderBase] Alias=[POB] Column=EndCustomerPCN/></OutputList><MemoryFractions Input=1 Output=1/><Hash><Define

dValues/><HashKeysBuild><ColumnReference Database=[warehouse] Schema=[dbo] Table=[PurchaseOrderBase] Alias=[POB] Column=PurchaseOrderKey/></HashKeysBuild><HashKeysProbe><ColumnReference Database=[warehouse] Schema=[dbo] Table=[MSL_SalesOrderLineItemBase] 

Column=SalesOrderLineItemID/></HashKeysProbe><ProbeResidual><ScalarOperator ScalarString=[warehouse].[dbo].[MSL_SalesOrderLineItemBase].[SalesOrderLineItemID]=[warehouse].[dbo].[PurchaseOrderBase].[PurchaseOrderKey] as [POB].[PurchaseOrderKey]><Compare Co

mpareOp=EQ><ScalarOperator><Identifier><ColumnReference Database=[warehouse] Schema=[dbo] Table=[MSL_SalesOrderLineItemBase] Column=SalesOrderLineItemID/></Identifier></ScalarOperator><ScalarOperator><Identifier><ColumnReference Database=[warehouse] Schem

a=[dbo] Table=[PurchaseOrderBase] Alias=[POB] Column=PurchaseOrderKey/></Identifier></ScalarOperator></Compare></ScalarOperator></ProbeResidual><RelOp NodeId=2 PhysicalOp=Bitmap LogicalOp=Bitmap Create EstimateRows=355.513 EstimateIO=0 EstimateCPU=0.02901

29 AvgRowSize=25 EstimatedTotalSubtreeCost=1.19675 Parallel=1 EstimateRebinds=0 EstimateRewinds=0 EstimatedExecutionMode=Row><OutputList><ColumnReference Database=[warehouse] Schema=[dbo] Table=[PurchaseOrderBase] Alias=[POB] Column=PurchaseOrderKey/><Col

umnReference Database=[warehouse] Schema=[dbo] Table=[PurchaseOrderBase] Alias=[POB] Column=PurchaseOrderTypeCode/><ColumnReference Database=[warehouse] Schema=[dbo] Table=[PurchaseOrderBase] Alias=[POB] Column=EndCustomerPCN/></OutputList><Bitmap><Define

dValues><DefinedValue><ColumnReference Column=Bitmap1008/></DefinedValue></DefinedValues><HashKeys><ColumnReference Database=[warehouse] Schema=[dbo] Table=[PurchaseOrderBase] Alias=[POB] Column=PurchaseOrderKey/></HashKeys><RelOp NodeId=3 PhysicalOp=Para

llelism LogicalOp=Repartition Streams EstimateRows=355.513 EstimateIO=0 EstimateCPU=0.0290129 AvgRowSize=25 EstimatedTotalSubtreeCost=1.19675 Parallel=1 EstimateRebinds=0 EstimateRewinds=0 EstimatedExecutionMode=Row><OutputList><ColumnReference Database=[

warehouse] Schema=[dbo] Table=[PurchaseOrderBase] Alias=[POB] Column=PurchaseOrderKey/><ColumnReference Database=[warehouse] Schema=[dbo] Table=[PurchaseOrderBase] Alias=[POB] Column=PurchaseOrderTypeCode/><ColumnReference Database=[warehouse] Schema=[dbo

] Table=[PurchaseOrderBase] Alias=[POB] Column=EndCustomerPCN/></OutputList><Parallelism PartitioningType=Hash><PartitionColumns><ColumnReference Database=[warehouse] Schema=[dbo] Table=[PurchaseOrderBase] Alias=[POB] Column=PurchaseOrderKey/></PartitionC

olumns><RelOp NodeId=4 PhysicalOp=Nested Loops LogicalOp=Inner Join EstimateRows=355.513 EstimateIO=0 EstimateCPU=0.000495349 AvgRowSize=25 EstimatedTotalSubtreeCost=1.16773 Parallel=1 EstimateRebinds=0 EstimateRewinds=0 EstimatedExecutionMode=Row><Output

List><ColumnReference Database=[warehouse] Schema=[dbo] Table=[PurchaseOrderBase] Alias=[POB] Column=PurchaseOrderKey/><ColumnReference Database=[warehouse] Schema=[dbo] Table=[PurchaseOrderBase] Alias=[POB] Column=PurchaseOrderTypeCode/><ColumnReference 

Database=[warehouse] Schema=[dbo] Table=[PurchaseOrderBase] Alias=[POB] Column=EndCustomerPCN/></OutputList><NestedLoops Optimized=0 WithUnorderedPrefetch=1><OuterReferences><ColumnReference Database=[warehouse] Schema=[dbo] Table=[PurchaseOrderBase] Alia

s=[POB] Column=PurchaseOrderKey/><ColumnReference Column=Expr1007/></OuterReferences><RelOp NodeId=6 PhysicalOp=Index Seek LogicalOp=Index Seek EstimateRows=355.513 EstimateIO=0.003125 EstimateCPU=0.000182688 AvgRowSize=11 EstimatedTotalSubtreeCost=0.0033

0769 TableCardinality=2.39812e+007 Parallel=1 EstimateRebinds=0 EstimateRewinds=0 EstimatedExecutionMode=Row><OutputList><ColumnReference Database=[warehouse] Schema=[dbo] Table=[PurchaseOrderBase] Alias=[POB] Column=PurchaseOrderKey/></OutputList><IndexS

can Ordered=1 ScanDirection=FORWARD ForcedIndex=0 ForceSeek=0 ForceScan=0 NoExpandHint=0 Storage=RowStore><DefinedValues><DefinedValue><ColumnReference Database=[warehouse] Schema=[dbo] Table=[PurchaseOrderBase] Alias=[POB] Column=PurchaseOrderKey/></Defi

nedValue></DefinedValues><Object Database=[warehouse] Schema=[dbo] Table=[PurchaseOrderBase] Index=[IX_PurchaseOrder_DirectCustomerKey] Alias=[POB] IndexKind=NonClustered/><SeekPredicates><SeekPredicateNew><SeekKeys><Prefix ScanType=EQ><RangeColumns><Colu

mnReference Database=[warehouse] Schema=[dbo] Table=[PurchaseOrderBase] Alias=[POB] Column=DirectCustomerKey/></RangeColumns><RangeExpressions><ScalarOperator ScalarString=CONVERT_IMPLICIT(int,&apos;New Order&apos;,0)><Identifier><ColumnReference Column=C

onstExpr1006><ScalarOperator><Convert DataType=int Style=0 Implicit=1><ScalarOperator><Const ConstValue=&apos;New Order&apos;/></ScalarOperator></Convert></ScalarOperator></ColumnReference></Identifier></ScalarOperator></RangeExpressions></Prefix></SeekKe

ys></SeekPredicateNew></SeekPredicates></IndexScan></RelOp><RelOp NodeId=8 PhysicalOp=Clustered Index Seek LogicalOp=Clustered Index Seek EstimateRows=1 EstimateIO=0.003125 EstimateCPU=0.0001581 AvgRowSize=18 EstimatedTotalSubtreeCost=1.16393 TableCardina

lity=2.39812e+007 Parallel=1 EstimateRebinds=354.513 EstimateRewinds=0 EstimatedExecutionMode=Row><OutputList><ColumnReference Database=[warehouse] Schema=[dbo] Table=[PurchaseOrderBase] Alias=[POB] Column=PurchaseOrderTypeCode/><ColumnReference Database=

[warehouse] Schema=[dbo] Table=[PurchaseOrderBase] Alias=[POB] Column=EndCustomerPCN/></OutputList><IndexScan Lookup=1 Ordered=1 ScanDirection=FORWARD ForcedIndex=0 ForceSeek=0 ForceScan=0 NoExpandHint=0 Storage=RowStore><DefinedValues><DefinedValue><Colu

mnReference Database=[warehouse] Schema=[dbo] Table=[PurchaseOrderBase] Alias=[POB] Column=PurchaseOrderTypeCode/></DefinedValue><DefinedValue><ColumnReference Database=[warehouse] Schema=[dbo] Table=[PurchaseOrderBase] Alias=[POB] Column=EndCustomerPCN/>

</DefinedValue></DefinedValues><Object Database=[warehouse] Schema=[dbo] Table=[PurchaseOrderBase] Index=[UCIX_PurchaseOrder_PurchaseOrderKey] Alias=[POB] TableReferenceId=-1 IndexKind=Clustered/><SeekPredicates><SeekPredicateNew><SeekKeys><Prefix ScanTyp

e=EQ><RangeColumns><ColumnReference Database=[warehouse] Schema=[dbo] Table=[PurchaseOrderBase] Alias=[POB] Column=PurchaseOrderKey/></RangeColumns><RangeExpressions><ScalarOperator ScalarString=[warehouse].[dbo].[PurchaseOrderBase].[PurchaseOrderKey] as 

[POB].[PurchaseOrderKey]><Identifier><ColumnReference Database=[warehouse] Schema=[dbo] Table=[PurchaseOrderBase] Alias=[POB] Column=PurchaseOrderKey/></Identifier></ScalarOperator></RangeExpressions></Prefix></SeekKeys></SeekPredicateNew></SeekPredicates

></IndexScan></RelOp></NestedLoops></RelOp></Parallelism></RelOp></Bitmap></RelOp><RelOp NodeId=14 PhysicalOp=Parallelism LogicalOp=Repartition Streams EstimateRows=6.50708e+007 EstimateIO=0 EstimateCPU=52.0038 AvgRowSize=11 EstimatedTotalSubtreeCost=184.

495 Parallel=1 EstimateRebinds=0 EstimateRewinds=0 EstimatedExecutionMode=Row><OutputList><ColumnReference Database=[warehouse] Schema=[dbo] Table=[MSL_SalesOrderLineItemBase] Column=SalesOrderLineItemID/></OutputList><Parallelism PartitioningType=Hash><P

artitionColumns><ColumnReference Database=[warehouse] Schema=[dbo] Table=[MSL_SalesOrderLineItemBase] Column=SalesOrderLineItemID/></PartitionColumns><RelOp NodeId=15 PhysicalOp=Index Scan LogicalOp=Index Scan EstimateRows=6.50708e+007 EstimateIO=108.632 

EstimateCPU=23.8593 AvgRowSize=11 EstimatedTotalSubtreeCost=132.491 TableCardinality=6.50708e+007 Parallel=1 EstimateRebinds=0 EstimateRewinds=0 EstimatedExecutionMode=Row><OutputList><ColumnReference Database=[warehouse] Schema=[dbo] Table=[MSL_SalesOrde

rLineItemBase] Column=SalesOrderLineItemID/></OutputList><IndexScan Ordered=0 ForcedIndex=0 ForceSeek=0 ForceScan=0 NoExpandHint=0 Storage=RowStore><DefinedValues><DefinedValue><ColumnReference Database=[warehouse] Schema=[dbo] Table=[MSL_SalesOrderLineIt

emBase] Column=SalesOrderLineItemID/></DefinedValue></DefinedValues><Object Database=[warehouse] Schema=[dbo] Table=[MSL_SalesOrderLineItemBase] Index=[IX_MSL_SalesOrderLineItemBase_SalesOrderLineItemID] IndexKind=NonClustered/><Predicate><ScalarOperator 

ScalarString=PROBE([Bitmap1008],[warehouse].[dbo].[MSL_SalesOrderLineItemBase].[SalesOrderLineItemID],N&apos;[IN ROW]&apos;)><Intrinsic FunctionName=PROBE><ScalarOperator><Identifier><ColumnReference Column=Bitmap1008/></Identifier></ScalarOperator><Scala

rOperator><Identifier><ColumnReference Database=[warehouse] Schema=[dbo] Table=[MSL_SalesOrderLineItemBase] Column=SalesOrderLineItemID/></Identifier></ScalarOperator><ScalarOperator><Const ConstValue=N&apos;[IN ROW]&apos;/></ScalarOperator></Intrinsic></

ScalarOperator></Predicate></IndexScan></RelOp></Parallelism></RelOp></Hash></RelOp></Parallelism></RelOp></QueryPlan></StmtSimple></Statements></Batch></BatchSequence></ShowPlanXML>

select po.endcustomerpcn , purchaseordertypecode from warehouse..purchaseorder po 
inner hash join warehouse..salesorderlineitem sli on
po.purchaseorderkey = sli.salesorderlineitemid
where po.DirectCustomerKey = 'New Order'

*/
CREATE procedure parsexml3 as
set nocount on
if exists(select * from tempdb..sysobjects where name like '%#returnlist%')
   drop table #returnlist
create table #returnlist (databasename varchar(255),tablename varchar(255),aliasname varchar(255),columnname varchar(255))

if  exists(select * from sysobjects where name like '%filterlist%')
   drop table filterlist
create table filterlist (databasename varchar(255),tablename varchar(255),aliasname varchar(255),columnname varchar(255))

if exists(select * from tempdb..sysobjects where name like '%#xmlfilter%')
   drop table #xmlfilter
create table #xmlfilter(filterstring varchar(255))


if exists(select * from sysobjects where name like '%outputlist%')
   drop table outputlist
create table outputlist (databasename varchar(255),tablename varchar(255),aliasname varchar(255),columnname varchar(255))

declare @databasename varchar(255)
declare @tablename varchar(255)
declare @aliasname varchar(255)
declare @columnname varchar(255)
declare @sql nvarchar(max)
declare @relop nvarchar(max)
declare @filterlist nvarchar(max)
declare @outputlist nvarchar(max)
select @sql = sqltext from queryxml where id in (select max(id) from queryxml)
select @relop = @sql
select @filterlist = ''

insert into #xmlfilter select 'outputlist'


  exec getcolumns @relop
  insert into outputlist select * from #returnlist

truncate table #xmlfilter
insert into #xmlfilter select 'HashKeysProbe'
insert into #xmlfilter select 'HashKeysBuild'
insert into #xmlfilter select 'SeekPredicates'
--insert into #xmlfilter select 'Predicate'

  exec getcolumns @relop
  insert into filterlist select * from #returnlist

  select distinct * from outputlist
  select distinct * from filterlist

