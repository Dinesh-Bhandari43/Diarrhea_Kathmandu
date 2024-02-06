library(ggplot2)
install.packages("readxl")
library(readxl)

data1 <- read_excel("C:/Users/resh/Desktop/Forestplot/adjusted.xlsx")
p = ggplot(data=data1,
           aes(x = Estimates,y = Relative_Risk, ymin = Lower_limit, ymax = Upper_limit ))+
  geom_pointrange(aes(col=Estimates))+
  geom_hline(aes(fill=Estimates),yintercept =1, linetype=2)+
  xlab('Climate variables at different lags')+ ylab("Relative Risk (95% Confidence Interval)")+
  geom_errorbar(aes(ymin=Lower_limit, ymax=Upper_limit,col=Estimates),width=0.5,cex=1)+ 
  facet_wrap(~Variables,strip.position="left",nrow=9,scales = "free_y") +
  theme(plot.title=element_text(size=16,face="bold"),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank(),
        axis.text.x=element_text(face="bold"),
        axis.title=element_text(size=12,face="bold"),
        strip.text.y = element_text(hjust=0,vjust = 1,angle=180,face="bold"))+
  coord_flip()
p
