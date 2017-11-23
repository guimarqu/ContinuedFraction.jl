# ContinuedFraction.jl (wip)

Example :

```julia
using ContinuedFraction

p = PartialQuotients(qi_sqrt(12))
@show p

c = Convergents(p, accuracy = 15)
for i in c
  println(i)
end
```


output : 
```
Partial quotients of (√12 + 0) / 1
 > [3, 2, 6]
 > period length is 2
 
3//1
7//2
45//13
97//28
627//181
1351//390
8733//2521
18817//5432
121635//35113
262087//75658
1694157//489061
3650401//1053780
23596563//6811741
50843527//14677262
328657725//94875313
```
