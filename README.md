# GA-VRPTW
 A Genetic Algorithm for Vehicle Routing Problem with Time Windows

Just run main.m, test data can be changed here.

1. **createInitChrom.m**

   To generate the first chromosome, random but consider the time window.
   
2. **route2Chrom.m**

   猜测是将每个机器人的配送方案，组合为一个完整的chromosome，但是加入了序列号之外的点，不知道后面如何解决？

3. **createInitPopulation.m**

   Chromosomes * number of chromosomes in one generation.

   Just a copy of the first chromosome 

4. **decode.m**

   Seperate a chromosome to several routes

   Delete empty routes
   
   Calculate the violated customer and the violated vehicle
   
   Violated customer means, the time window constraints cannot be satisfied.
   
5. **deleteEmptyRoutes.m**

   Delete empty routes

6. **Judge.m**

   Flag == 1 means violated

   Some other constraints may be added in this function.

7. **beginServiceVehicles.m** 

   Calculate the start time of service for every customer and the return time.

8. **begin_s.m**

   Calculate the start time for every customer and the time of return to depot.

   The travel time here is equal to the distance.

9. **Judge_TW.m**

   Check the time window constraints for every customer

10. **calObj.m**

    calculate the value of objective function

11. **costFuction.m**

    == objective function == total traveled distance + weight * total late time

12. **violateTW.m**

    Calculate total late time

13. Select.m

