# Value Difference Metric in R
An implimentation of Value Difference Metric in R <br>

Value difference metric was introduced in 1986 to provide an appropriate distance function for symbolic attributes. It is based on the idea that the goal of finding the distance is to find the right class by looking at the following conditional probabilities.

## Usage
``` R
data = read.csv('./data.csv')
head(data)
  one two y
1   0   1 2
2   0   2 2
3   0   2 3
4   0   3 3
5   0   3 3
6   0   3 3

# calculate the vdm conditional probabilities
proba = vdm_proba(data=data, y='y')

# we can calculate the vdm distance between 2 instances by
vdm_delta(proba=proba, ins_1=c('0', '1'), ins_2=c('1', '24'), norm=2)
[1] 0.6947607
```
