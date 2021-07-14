# GA-VRPTW
A Genetic Algorithm for Vehicle Routing Problem with Time Windows

## Main Procedures

```
1. create a random initial chromosome and the initial generation
2. while(maximal iterations not reached)
	a. calculate the fitness value
	b. select parent chromosome
	c. crossover
	d. mutate
	e. neighborhood search
3. display
```

## Explanation of Functions

Just run **main.m**, test data can be changed here.

1. **createInitChrom.m**

   To generate the first chromosome, random but consider the time window.

2. **route2Chrom.m**

   Convert routes to one chromosome

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

13. **Select.m** and **Sus.m**

    Use stochastic universal sampling

14. **Recombin.m** and **Crossover.m**

    Use order crossover

    1. Choose 2 numbers randomly, these 2 numbers are used as the range
    2. And the genes in this range to the beginning of other parent chromosome
    3. Delete the second same genes in the chromosome

15. **Mutate.m**

    swap 2 genes

16. **neighborhoodSearch.m**

    Do a large neighborhood search, it has two main parts:

    + **Remove.m**

      Remove some customers according to the relatedness value(Relatedness.m, values have relations with distance and route)

    + **ReInserting.m**

      Reinsert the customers back to the route, it will check every possible position and choose the position with least increased distance.
