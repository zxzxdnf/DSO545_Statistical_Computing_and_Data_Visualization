# Homework 1
# 1.Create a vector that contains numbers (10, 15, 20, 25, . . . , 130). Save it in a varaible called vec.
    vec=c(seq(from=10,to=130,by=5))
    
# 2. Use the function length() to find out how many elements there are in vec?
   length(vec)
   
# 3. What is the value of the 16th element?
   vec[16]
   
# 4. Look online for a function that computes the average, median, and standard deviation in R. Use these
#   functions to compute the average, median, and standard deviation for vec.
    mean(vec)
    median(vec)
    sd(vec)
    
# 5. List all the values that are multiples of 10. Save them all in a vector called vec10.
    vec10=vec*10
 
 
 
    
# 6. Read the dataset from “tips.csv”, and save it in a variable called tips.
     setwd("C:/Users/Xu Zhang/Desktop/DSO545/DSO545")
     tips=read.csv("tips.csv")
     
# 7. Use the function sum() to compute the total tips in the dataset.
     totaltips=sum(tips$tip)
     
# 8. How many females are there in the dataset?
     Ftip=tips[tips$sex=="M",]
     nrow(Ftip)
     
# 9. What is the total tip on a Thursday day?
     Thutip=tips[tips$day=="Thu",]
     SumThutip=sum(Thutip$tip)
     
# 10. How many female smokers are in the tips dataset who dine on Friday? 
      FtipFri=tips[tips$sex=="F" & tips$day=="Fri", ]
      nrow(FtipFri)
      