  female_engineering=
  Data %>% 
  filter(major_category=="Engineering", sharewomen>=0.5) %>%
  arrange(-sharewomen)

Data %>% 
  filter(major_category %in% c("Engineering","Business")) %>%
  summarise(sum(total))
  
Top= Data %>%
       mutate(unemployment_rate= unemployed/total) %>%
       select(major,unemployment_rate) %>%
       arrange(-unemployment_rate)
Top_10=Top[1:10,]
Top_10


ggplot(Top_10, aes(x=unemployment_rate*100,y = reorder(major, unemployment_rate)))+
    scale_x_continuous(breaks = seq(10,15.5,0.5))+
    xlab("Rate (%)")+
    ggtitle("Highest Unemployment Rates by Major")+
    geom_point()

majors_total=Data %>%
       select(major_category,total) %>%
       group_by(major_category) %>%
       summarise(Sum_of_total=sum(total)) %>%
       arrange(-Sum_of_total)
majors_total=as.data.frame(majors_total)
majors_total

Top5major_catagory=as.data.frame(majors_total[1:5,])

ggplot(Top5major_catagory, aes(x = reorder(major_category, Sum_of_total),y=Sum_of_total/1000))+
  scale_y_continuous(breaks = seq(0,1250,250)) +
  geom_bar(stat = "identity")+
  xlab("") + 
  ylab("Total Number of Stundets (1000's)") + 
  coord_flip()

 
majors_total$total_category=NA
for (i in 1:dim(majors_total)[1]){
    if(majors_total$Sum_of_total[i]>=500000){
      majors_total$total_category[i]="High"
            }
      else{
        majors_total$total_category[i]="Low"
      }
}
majors_total

ggplot(majors_total, aes(x = reorder(major_category,Sum_of_total),y=Sum_of_total/1000,fill=total_category))+
  scale_y_continuous(breaks = seq(0,1250,250)) +
  geom_bar(stat = "identity")+
  xlab("") + 
  ylab("Total Number of Stundets (1000's)") + 
  coord_flip()+
  scale_fill_manual(values = c("red","lightblue"))
  




