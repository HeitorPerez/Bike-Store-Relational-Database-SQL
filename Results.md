# Relatório de Resultados SQL

## 📊 Sumário 
1. [Total Revenue per Store](#1-total-revenue-per-store)
2. [Top 10 Most Expensive Products](#2-top-10-most-expensive-products)
3. [Order Count per Staff Member](#3-order-count-per-staff-member)
4. [Average Product Price by Category](#4-average-product-price-by-category)
5. [Revenue by Category](#5-revenue-by-category)
6. [Out of Stock Products](#6-out-of-stock-products)
7. [Frequent Customers (More than 2 orders)](#7-frequent-customers-more-than-2-orders)
8. [Average Order Value (AOV) per Customer](#8-average-order-value-aov-per-customer)
9. [Products Never Sold](#9-products-never-sold)
10. [Total Revenue per Staff Member](#10-total-revenue-per-staff-member)
11. [Staff Sales Ranking By Store](#11-staff-sales-ranking-by-store)
12. [Month-over-Month Sales Performance](#12-month-over-month-sales-performance)

---

## 1. Total Revenue per Store
| store_name       | total            |
| ---------------- | ---------------- |
| Baldwin Bikes    | $   5,826,242.21 |
| Santa Cruz Bikes | $   1,790,145.91 |
| Rowlett Bikes    | $     962,600.76 |

With this query, we can clearly see that the best-performing store is Baldwin Bikes, generating three times more revenue than Santa Cruz Bikes, the second-best performer.



## 2. Top 10 Most Expensive Products
| product_name                           | most_expensive   |
| -------------------------------------- | ---------------- |
| Trek Domane SLR 9 Disc - 2018          | $      11,999.99 |
| Trek Domane SLR 8 Disc - 2018          | $       7,499.99 |
| Trek Domane SL Frameset - 2018         | $       6,499.99 |
| Trek Silque SLR 8 Women's - 2017       | $       6,499.99 |
| Trek Domane SL Frameset Women's - 2018 | $       6,499.99 |
| Trek Emonda SLR 8 - 2018               | $       6,499.99 |
| Trek Silque SLR 7 Women's - 2017       | $       5,999.99 |
| Trek Domane SL 8 Disc - 2018           | $       5,499.99 |
| Trek Domane SLR 6 Disc - 2017          | $       5,499.99 |
| Trek Domane SLR 6 Disc - 2018          | $       5,499.99 |

This table shows the most expensive products in the store, and its clear that the Trek Domane SLR 9 Disc - 2018 ranks first, being 60% more expensive than the second place product.




## 3. Order Count Per Staff Member
| first_name | order_count | store_name       |
| ---------- | ----------- | ---------------- |
| Marcelene  | 553         | Baldwin Bikes    |
| Venita     | 540         | Baldwin Bikes    |
| Genna      | 184         | Santa Cruz Bikes |
| Mireya     | 164         | Santa Cruz Bikes |
| Kali       | 88          | Rowlett Bikes    |
| Layla      | 86          | Rowlett Bikes    |

This table shows the number of orders of each staff member and their store name. After looking at the results it confirm the data shown in Table 1. Here, we can clearly see that the Staff Members who work in Baldwin bikes have a much higher  sales volume than those in other stores. We also see that the discrepancy between staff members within the same store is low, indicating that the stores have a really good distribution of oders among the staff.




## 4. Average Product Price by Category
| category_name       | average_price    |
| ------------------- | ---------------- |
| Electric Bikes      | $       3,281.66 |
| Road Bikes          | $       3,175.36 |
| Cyclocross Bicycles | $       2,542.79 |
| Mountain Bikes      | $       1,649.76 |
| Cruisers Bicycles   | $         730.41 |
| Comfort Bicycles    | $         682.12 |
| Children Bicycles   | $         287.79 |

This table shows the average product price by category. The results indicate that Electric Bikes and Road Bikes have the highest average prices overall, while Children’s Bikes have by far the lowest average price.



## 5. Revenue by Category
| category_name       | revenue          | times_sold |
| ------------------- | ---------------- | ---------- |
| Mountain Bikes      | $   3,030,775.71 | 1183       |
| Road Bikes          | $   1,852,555.60 | 374        |
| Cruisers Bicycles   | $   1,109,151.04 | 1378       |
| Electric Bikes      | $   1,020,236.85 | 212        |
| Cyclocross Bicycles | $     799,874.60 | 256        |
| Comfort Bicycles    | $     438,506.87 | 537        |
| Children Bicycles   | $     327,888.21 | 782        |

This table shows the total revenue by category, giving an overview of the Bike Store´s revenue strengths. Using the data Table 4, and comparing it with Table 5, Mountain Bike has the 4th higher average price but its first in revenue. This is due to the high sales volume, with units sold being 75% above the average. The same applis to Cruiser Bicycles, which have 104% more sales than the overall average.




## 6. Out of Stock Products
| no_stock                                      |
| --------------------------------------------- |
| Electra Amsterdam Royal 8i Ladies - 2018      |
| Electra Cruiser 1 Ladies' - 2018              |
| Electra Girl's Hawaii 1 (16-inch) - 2015/2016 |
| Electra Townie Commute Go! - 2018             |
| Electra Townie Go! 8i - 2017/2018             |
| Electra Townie Original 1 - 2018              |
| Electra Townie Original 1 Ladies' - 2018      |
| Electra Townie Original 21D - 2018            |
| Electra Townie Original 3i EQ Ladies' - 2018  |
| Haro Shredder 20 - 2017                       |
| Surly Ice Cream Truck Frameset - 2016         |
| Surly Pack Rat - 2018                         |
| Surly Straggler - 2018                        |
| Surly Wednesday Frameset - 2016               |
| Trek CrossRip 1 - 2018                        |
| Trek Domane S 5 Disc - 2017                   |
| Trek Domane SL 6 Disc - 2018                  |
| Trek Domane SLR Frameset - 2018               |
| Trek Emonda SLR 6 - 2018                      |
| Trek Farley Alloy Frameset - 2017             |
| Trek Fuel EX 5 27.5 Plus - 2017               |
| Trek Precaliber 24 (21-Speed) - Girls - 2017  |
| Trek Remedy 29 Carbon Frameset - 2016         |
| Trek Remedy 9.8 - 2017                        |

This table gives us the exact items that are not in stock.




## 7. Frequent Customers (More than 2 orders)
This list has been limited to the top 10 customers for demonstration purposes


| full_name          | orders |
| ------------------ | ------ |
| Robby Sykes        | 3      |
| Latasha Hays       | 3      |
| Deloris Burke      | 3      |
| Lizzette Stein     | 3      |
| Tobie Little       | 3      |
| Corene Wall        | 3      |
| Lashawn Ortiz      | 3      |
| Lolita Mosley      | 3      |
| Williemae Holloway | 3      |
| Ronna Butler       | 3      |

Returns the name and number of orders of each frequent customer.




## 8. Average Order Value (AOV) per Customer
This list has been limited to the top 10 customers for demonstration purposes


| full_name        | to_char          |
| ---------------- | ---------------- |
| Shena Carter     | $      27,618.95 |
| Abram Copeland   | $      26,913.92 |
| Adena Blake      | $      22,999.94 |
| Brigid Sharp     | $      22,299.95 |
| Danielle Bond    | $      22,000.92 |
| Cindi Larson     | $      21,816.93 |
| Augustina Joyner | $      21,789.92 |
| Bess Mcbride     | $      21,097.95 |
| Ashanti Hammond  | $      20,997.94 |
| Ruthanne Franco  | $      20,679.95 |

This table gives information about clients AOV, from highest to lowest. Knowleadge about clients AOV helps to profile high-value clients, as a higher AOV means higher profit per sale.




## 9. Products Never Sold
| zero_sales_product                             |
| ---------------------------------------------- |
| Electra Savannah 1 (20-inch) - Girl's - 2018   |
| Electra Sweet Ride 1 (20-inch) - Girl's - 2018 |
| Electra Townie Go! 8i Ladies' - 2018           |
| Surly Krampus Frameset - 2018                  |
| Trek 820 - 2016                                |
| Trek Checkpoint ALR 4 Women's - 2019           |
| Trek Checkpoint ALR 5 - 2019                   |
| Trek Checkpoint ALR 5 Women's - 2019           |
| Trek Checkpoint ALR Frameset - 2019            |
| Trek Checkpoint SL 5 Women's - 2019            |
| Trek Checkpoint SL 6 - 2019                    |
| Trek Domane SLR 6 Disc Women's - 2018          |
| Trek Kids' Dual Sport - 2018                   |
| Trek Precaliber 12 Girl's - 2018               |

This table list us the exact products that have never been sold.




## 10. Total Revenue per Staff Member
Null results indicate that the staff member has not made any sales up to the point of data collection.


| staff_member       | total_sales      |
| ------------------ | ---------------- |
| Marcelene Boyer    | $   2,938,888.73 |
| Venita Daniel      | $   2,887,353.48 |
| Genna Serrano      | $     952,722.26 |
| Mireya Copeland    | $     837,423.65 |
| Kali Vargas        | $     516,695.17 |
| Layla Terrell      | $     445,905.59 |
| Virgie Wiggins     | null             |
| Bernardine Houston | null             |
| Fabiola Jackson    | null             |
| Jannette David     | null             |

This table list from higher to lower the total revenue per staff member. Taking a look at tables 1 and 3, and comparing the data we can see that the revenue per staff member is primary decorrent of each store sales volume. 




## 11. Average Order Value (AOV) per Staff Member

| staff_member       | avg_order_value  |
| ------------------ | ---------------- |
| Marcelene Boyer    | $       5,314.45 |
| Venita Daniel      | $       5,346.95 |
| Genna Serrano      | $       5,177.84 |
| Mireya Copeland    | $       5,106.24 |
| Kali Vargas        | $       5,871.54 |
| Layla Terrell      | $       5,184.95 |
| Virgie Wiggins     | null             |
| Fabiola Jackson    | null             |
| Jannette David     | null             |
| Bernardine Houston | null             |

This table was created to complement Table 10 by calculating each staff member’s AOV. The results show that revenue per staff member is highly correlated with sales volume, rather than with the average sale price.




## 12. Month-over-Month Sales Performance

| year | month | sales_month      | month_before     | sales_difference | monthperformace |
| ---- | ----- | ---------------- | ---------------- | ---------------- | --------------- |
| 2016 | 1     | $     241,184.15 | null             | null             | Start!          |
| 2016 | 2     | $     175,768.10 | $     241,184.15 | $     -65,416.05 | Decline         |
| 2016 | 3     | $     202,157.14 | $     175,768.10 | $      26,389.04 | Growth          |
| 2016 | 4     | $     187,223.55 | $     202,157.14 | $     -14,933.59 | Decline         |
| 2016 | 5     | $     228,701.13 | $     187,223.55 | $      41,477.58 | Growth          |
| 2016 | 6     | $     231,120.29 | $     228,701.13 | $       2,419.16 | Growth          |
| 2016 | 7     | $     222,854.21 | $     231,120.29 | $      -8,266.08 | Decline         |
| 2016 | 8     | $     253,130.83 | $     222,854.21 | $      30,276.62 | Growth          |
| 2016 | 9     | $     303,282.61 | $     253,130.83 | $      50,151.78 | Growth          |
| 2016 | 10    | $     235,051.79 | $     303,282.61 | $     -68,230.82 | Decline         |
| 2016 | 11    | $     205,315.47 | $     235,051.79 | $     -29,736.32 | Decline         |
| 2016 | 12    | $     223,695.20 | $     205,315.47 | $      18,379.73 | Growth          |
| 2017 | 1     | $     316,954.77 | $     223,695.20 | $      93,259.57 | Growth          |
| 2017 | 2     | $     348,740.47 | $     316,954.77 | $      31,785.70 | Growth          |
| 2017 | 3     | $     348,177.13 | $     348,740.47 | $        -563.34 | Decline         |
| 2017 | 4     | $     254,105.57 | $     348,177.13 | $     -94,071.56 | Decline         |
| 2017 | 5     | $     297,754.66 | $     254,105.57 | $      43,649.09 | Growth          |
| 2017 | 6     | $     419,892.07 | $     297,754.66 | $     122,137.41 | Growth          |
| 2017 | 7     | $     255,727.63 | $     419,892.07 | $    -164,164.44 | Decline         |
| 2017 | 8     | $     322,553.32 | $     255,727.63 | $      66,825.69 | Growth          |
| 2017 | 9     | $     329,388.68 | $     322,553.32 | $       6,835.36 | Growth          |
| 2017 | 10    | $     345,316.18 | $     329,388.68 | $      15,927.50 | Growth          |
| 2017 | 11    | $     315,881.67 | $     345,316.18 | $     -29,434.51 | Decline         |
| 2017 | 12    | $     291,022.87 | $     315,881.67 | $     -24,858.80 | Decline         |
| 2018 | 1     | $     426,301.72 | $     291,022.87 | $     135,278.85 | Growth          |
| 2018 | 2     | $     223,941.44 | $     426,301.72 | $    -202,360.28 | Decline         |
| 2018 | 3     | $     406,701.20 | $     223,941.44 | $     182,759.76 | Growth          |
| 2018 | 4     | $     909,179.47 | $     406,701.20 | $     502,478.27 | Growth          |
| 2018 | 6     | $         209.99 | $     909,179.47 | $    -908,969.48 | Decline         |
| 2018 | 7     | $      12,949.89 | $         209.99 | $      12,739.90 | Growth          |
| 2018 | 8     | $      10,256.91 | $      12,949.89 | $      -2,692.98 | Decline         |
| 2018 | 9     | $       9,949.96 | $      10,256.91 | $        -306.95 | Decline         |
| 2018 | 10    | $       4,219.92 | $       9,949.96 | $      -5,730.04 | Decline         |
| 2018 | 11    | $      12,278.93 | $       4,219.92 | $       8,059.01 | Growth          |
| 2018 | 12    | $       7,999.96 | $      12,278.93 | $      -4,278.97 | Decline         |


This table was developed to support the time-based performance analysis above:

![Monthly Sales Performance](Graphics/Monthly%20Sales%20Performance%20(2016-2018).png)


