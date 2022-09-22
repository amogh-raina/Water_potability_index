select * from WaterPotability..data;


select * from WaterPotability..data order by 'Potability';

-- value counts of Potability
select count(distinct(Potability)) as potability_value_counts from WaterPotability..data; 

-- average of ph
select avg(ph) as average_ph from WaterPotability..data; 

-- average of Hardness
select avg(Hardness) as average_hardness from WaterPotability..data; 

-- average of Solids
select avg(Solids) as average_solids from WaterPotability..data; 

-- average of Chloramines
select avg(Chloramines) as average_chloramines from WaterPotability..data; 

-- average of Sulfate
select avg(Sulfate) as average_sulfate from WaterPotability..data; 

-- average of Conductivity
select avg(Conductivity) as average_ph from WaterPotability..data; 

-- average of Organic_carbon
select avg(Organic_carbon) as average_ph from WaterPotability..data; 

-- average of Trihalomethanes
select avg(Trihalomethanes) as average_ph from WaterPotability..data; 

-- average of Turbidity
select avg(Turbidity) as average_ph from WaterPotability..data; 

-- getting average of multiple columns
Select *,
       (select AVG(Col)
        FROM   (VALUES([Hardness]),
					([Solids]),
					(Sulfate)) as col_average(col)) 
					  from WaterPotability..data;

-- count of null values
Select count(*) as count_of_null_values_in_data from WaterPotability..data where 
							ph is null or
							Sulfate is null or
							Trihalomethanes is null ;

-- Analysis of data where Potability = 0
select Count(*) as instances_P_is_0 from WaterPotability..data where Potability=0;
Select max(ph) as max_ph,min(ph) as min_ph from WaterPotability..data where Potability=0;
select avg(Hardness) as average_hardness from WaterPotability..data where Potability=0; 
select avg(Chloramines) as average_ch from WaterPotability..data where Potability=0; 
select avg(Sulfate) as average_sf from WaterPotability..data where Potability=0; 
select avg(Organic_carbon) as average_og from WaterPotability..data where Potability=0; 
select avg(Trihalomethanes) as average_tr from WaterPotability..data where Potability=0; 


--Analysis of data where Potability = 1
select count(*) as instances_P_is_1 from WaterPotability..data where Potability=1;
Select max(ph) as max_ph,min(ph) as min_ph from WaterPotability..data where Potability=1;
select avg(Hardness) as average_hardness from WaterPotability..data where Potability=1; 
select avg(Chloramines) as average_ch from WaterPotability..data where Potability=1; 
select avg(Sulfate) as average_sf from WaterPotability..data where Potability=1; 
select avg(Organic_carbon) as average_og from WaterPotability..data where Potability=1; 
select avg(Trihalomethanes) as average_tr from WaterPotability..data where Potability=1; 

-- 0<ph<7 -> count of instances that have basic acidic ph and potability=0
select * from WaterPotability..data where Potability=0 and ph between 0 and 7;
select count(*) from WaterPotability..data where Potability=0 and ph between 0 and 7;

-- 7<ph<14 -> count of instances that have basic Basic ph and potability=0
select * from WaterPotability..data where Potability=0 and ph between 7 and 14;
select count(*) from WaterPotability..data where Potability=0 and ph between 7 and 14;

-- 0<ph<7 -> count of instances that have basic acidic ph and potability=1
select * from WaterPotability..data where Potability=1 and ph between 0 and 7;
select count(*) from WaterPotability..data where Potability=1 and ph between 0 and 7;

-- 7<ph<14 -> count of instances that have basic Basic ph and potability=1
select * from WaterPotability..data where Potability=1 and ph between 7 and 14;
select count(*) from WaterPotability..data where Potability=1 and ph between 7 and 14;

