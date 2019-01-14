---
title: "DSO545_HW02"
author: "Xu Zhang"
date: "February 7, 2018"
output: word_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

```{r}
getwd()
FlyData=read.csv("flying.csv")
```

(1) (2 point) Use dplyr functions and the pipe operator %>% to divide the dataset into two dataframes:males_data and female_data. Each dataframe should include only the following variables:respondent_id, gender, baby.

```{r}
library(dplyr)
library(ggplot2)
males_data=
  FlyData %>% 
  select(respondent_id, gender, baby) %>%
  filter(gender=="Male")
females_data=
  FlyData %>% 
  select(respondent_id, gender, baby) %>%
  filter(gender=="Female")
```

(2) (2 points) What is the percentage of males who thinks that it is totally fine to bring a baby on the plane? What is the percentage of females who thinks that it is totally fine to bring a baby on the plane? Who is more tolerant?
```{r}
paste(round(nrow(males_data %>% filter(baby=="No"))/nrow(males_data)*100,3),"%")
```

```{r}
paste(round(nrow(females_data %>% filter(baby=="No"))/nrow(females_data)*100,3),"%")
```
Female is more tolerent.

(3) (2 points) Compute the percentages of people who think that the following are very annoying. Which is the most annoying to fliers?
• Bring a baby on a plane
```{r}
paste(round(nrow(FlyData %>% filter(baby=="Very"))/nrow(FlyData)*100,3),"%")
```
• Be chatty and talking to strangers
```{r}
paste(round(nrow(FlyData %>% filter(talk_stranger=="Very"))/nrow(FlyData)*100,3),"%")
```
• Wake someone up to go for a walk
```{r}
paste(round(nrow(FlyData %>% filter(wake_up_walk=="Very"))/nrow(FlyData)*100,3),"%")
```
• Wake someone up to use the bathroom
```{r}
paste(round(nrow(FlyData %>% filter(wake_up_bathroom=="Very"))/nrow(FlyData)*100,3),"%")
```
 Waking someone up to go for a walk is the most annoying to filter
 
 
 (4 points) Create the following two plots.

```{r, echo=TRUE}
NewFlyData=FlyData[!is.na(FlyData$household_income),]
lev = levels(NewFlyData$household_income)
lev = lev[c(1,3,4,2)]
NewFlyData$household_income = factor(NewFlyData$household_income, levels = lev)

NewFlyData %>%
  filter(gender=="Female" & age=="30-44") %>%
  group_by(household_income) %>% 
  ggplot(aes(x = household_income)) +
  geom_bar() +
  ggtitle("Income Distribution for Females in the Age Range of 30-44") + 
  xlab("Income") + 
  ylab("Count of Flyer")

```

```{r, echo=TRUE}
NewFlyData=FlyData[!is.na(FlyData$household_income),]
lev = levels(NewFlyData$household_income)
lev = lev[c(1,3,4,2)]
NewFlyData$household_income = factor(NewFlyData$household_income, levels = lev)

NewFlyData %>%
  filter(gender=="Male" & age=="30-44") %>%
  group_by(household_income) %>% 
  ggplot(aes(x = household_income)) +
  geom_bar() +
  ggtitle("Income Distribution for Males in the Age Range of 30-44") + 
  xlab("Income") + 
  ylab("Count of Flyer")
```
