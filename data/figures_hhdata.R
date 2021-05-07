library(ggplot2)
library(foreign)
setwd("C:/")

## Figure 1 (Job Skill)

d <- read.table("occupation.txt",header=T)

d$pe <- d$c3
d$se <- d$c4
d$lb <- d$pe- 1.96*d$se
d$ub <- d$pe+ 1.96*d$se


d$group <- factor(d$c1,levels=c(1,2),
                  labels=c("Low Prejudice","High Prejudice")[2:1])


d$Country <- factor(d$c2,levels=c(1,2,3,4),labels=c("Germany","France","Poland","Mexico")[1:4] )


f4b = ggplot() + geom_pointrange(data=d, size=1.5, mapping=aes(x=group, y=pe, ymin=lb, ymax=ub, fill=Country,shape=Country), position = position_dodge(width=.5))
f4b = f4b + scale_x_discrete(name="")
f4b = f4b + scale_shape_manual(values=c(21,24,22,23))  # as before
f4b = f4b + scale_fill_manual(values=c("black","gray","white","red"))
#f4b = f4b + ggtitle("Figure 1: Replication of Hainmueller and Hopkins (2015) \n Skill Premium")  
f4b <- f4b + ylab("                    AMCE") + xlab("Sample")+ theme(text = element_text(size=24))
f4b <- f4b + theme(panel.background = element_rect(fill = "gray95"))
f4b <- f4b + geom_hline(yintercept=0, colour="red")
print(f4b)
ggsave(file="neil_fig1_occupation.pdf")



## Figure 2 (Education)

d <- read.table("education.txt",header=T)

d$pe <- d$c3
d$se <- d$c4
d$lb <- d$pe- 1.96*d$se
d$ub <- d$pe+ 1.96*d$se


d$group <- factor(d$c1,levels=c(1,2),
                  labels=c("Low Prejudice","High Prejudice")[2:1])


d$Country <- factor(d$c2,levels=c(1,2,3,4),labels=c("Germany","France","Poland","Mexico")[1:4] )


f4b = ggplot() + geom_pointrange(data=d, size=1.5, mapping=aes(x=group, y=pe, ymin=lb, ymax=ub, fill=Country,shape=Country), position = position_dodge(width=.5))
f4b = f4b + scale_x_discrete(name="")
f4b = f4b + scale_shape_manual(values=c(21,24,22,23))  # as before
f4b = f4b + scale_fill_manual(values=c("black","gray","white","red"))
#f4b = f4b + ggtitle("Figure 1: Replication of Hainmueller and Hopkins (2015) \n Skill Premium")  
f4b <- f4b + ylab("                    AMCE") + xlab("Sample")+ theme(text = element_text(size=24))
f4b <- f4b + theme(panel.background = element_rect(fill = "gray95"))
f4b <- f4b + geom_hline(yintercept=0, colour="red")
print(f4b)
ggsave(file="neil_fig1_education.pdf")




