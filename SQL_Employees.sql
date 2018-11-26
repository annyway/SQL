
-- list the employee who has the highest salary
select top 1 name from [dbo].[ch4_hw_emp]
order by salary desc



-- list all department names along with the number of employees and total salary of each
select [DepName],count(*) as [Number of Employees], sum ([Salary]) as [Total Salary] from [dbo].[ch4_hw_emp] emp
 join [dbo].[ch4_hw_dep] dep 
on emp.[DepID]=dep.DepID
group by [DepName]



-- list employees who have higher salary than their boss
select a.Name, a.Salary as Salary, b.Name as Boss_Name, b.Salary as Boss_Salary from [dbo].[ch4_hw_emp] a
inner join [dbo].[ch4_hw_emp] b 
on a.BossID = b.EmpID
where a.Salary > b.Salary

select * from [dbo].[ch4_hw_emp] a
left join [dbo].[ch4_hw_emp] b 
on a.EmpID = b.BossID
union 
select * from [dbo].[ch4_hw_emp] a
left join [dbo].[ch4_hw_emp] b 
on a.EmpID = b.BossID