
#install.packages("ggplot2")
library(ggplot2)


head(midwest)

ggplot(midwest, aes(percollege, percpovertyknown)) + geom_point(size = 5)

ggplot(midwest, aes(percollege, percpovertyknown, colour = factor(inmetro), shape = state)) + geom_point(size = 5) +
  scale_shape_discrete(solid=F)

midwest_modified<-midwest
midwest_modified$state<-as.factor(midwest_modified$state)
midwest_modified$inmetro<-as.factor(midwest_modified$inmetro)
state_inmetro <- interaction(midwest_modified$state, midwest_modified$inmetro, sep = "_") # create a factor that account for both state and inmetro
#create character vectors for colour, shape and label
override.colour <- c("#F8766D", "#F8766D", "#F8766D", "#F8766D", "#F8766D", "#00BFC4", "#00BFC4", "#00BFC4", "#00BFC4", "#00BFC4")
names(override.colour) <- c("IL_0", "IN_0", "MI_0", "OH_0", "WI_0", "IL_1", "IN_1", "MI_1", "OH_1", "WI_1")
override.shape <- c(1, 2, 0, 3, 7, 1, 2, 0, 3, 7)
names(override.shape) <- c("IL_0", "IN_0", "MI_0", "OH_0", "WI_0", "IL_1", "IN_1", "MI_1", "OH_1", "WI_1")
override.label <- c("IL, non-metro", "IN, non-metro", "MI, non-metro", "OH, non-metro", "WI, non-metro", "IL, metro", "IN, metro", "MI, metro", "OH, metro", "WI, metro")
names(override.label) <- c("IL_0", "IN_0", "MI_0", "OH_0", "WI_0", "IL_1", "IN_1", "MI_1", "OH_1", "WI_1")
#plug arguments into ggplot function
ggplot(midwest_modified, aes(percollege, percpovertyknown, colour = state_inmetro, shape = state_inmetro)) + geom_point(size = 5) +
  scale_colour_manual(name = "State and In metro", values = override.colour, labels = override.label)+
  scale_shape_manual(name = "State and In metro", values = override.shape, labels = override.label)

