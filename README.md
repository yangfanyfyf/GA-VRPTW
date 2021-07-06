# GA-VRPTW
 A Genetic Algorithm for Vehicle Routing Problem with Time Windows

Just run main.m, test data can be changed here.

1. createInitChrom.m

   To generate the first chromosome, random but consider the time window.
   
2. change

   猜测是将每个机器人的配送方案，组合为一个完整的chromosome，但是加入了序列号之外的点，不知道后面如何解决？

3. createInitPopulation.m

   Chromosomes * number of chromosomes in one generation

   Just a copy of the first chromosome 

4. decode.m

   Seperate a chromosome to several routes

   Delete empty routes



5. deleteEmptyRoutes.m

   Delete empty routes

6. Judge.m

   Flag == 1 means violated

   Some other constraints may be added in this function.

7. beginServiceVehicles.m 

   Calculate the start time of service for every customer?

8. begin_s.m

9. Judge_TW.m

   Check the time window constraints for every custmer
