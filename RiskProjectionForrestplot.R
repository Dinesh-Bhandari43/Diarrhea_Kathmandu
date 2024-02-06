library(ggplot2)
library(readxl)

data1 <- read_excel("C:/Users/resh/Desktop/Forestplot/Projection.xlsx")
p = ggplot(data=data1,
           aes(x = Scenarios,y = Projected_count, ymin = Lower_limit, ymax = Upper_limit ))+
  geom_pointrange(aes(col=Scenarios))+
  geom_hline(aes(fill=Scenarios),yintercept =1, linetype=2)+
  xlab('Future risk scenarios')+ ylab("Projected increase in childhood diarrhoeal count (Uncertanity Interval)")+
  geom_errorbar(aes(ymin=Lower_limit, ymax=Upper_limit,col=Scenarios),width=0.5,cex=1)+ 
  facet_wrap(~Risk,strip.position="left",nrow=9,scales = "free_y") +
  theme(plot.title=element_text(size=16,face="bold"),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank(),
        axis.text.x=element_text(face="bold"),
        axis.title=element_text(size=12,face="bold"),
        strip.text.y = element_text(hjust=0,vjust = 1,angle=180,face="bold"))+
  coord_flip()
p
