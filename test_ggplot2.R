library(ggplot2)
##

##diamonds is a data.frame
##ggplot(df)+geom, aes can be defined for each layer or all
#each layer is specified by geom
#aes stands for  aesthetics

#1
ggplot(diamonds, aes(x=carat, y=price, color=cut)) + geom_point()+ geom_smooth()

#2, the same as 1
ggplot(diamonds) + geom_point(aes(x=carat, y=price, color=cut)) + geom_smooth(aes(x=carat, y=price, color=cut))

#labels:
gg=ggplot(diamonds, aes(x=carat, y=price, color=cut)) + geom_point() + labs(title="Scatterplot", x="Carat", y="Price")
print(gg)  #print the plot


#adjust the theme, for example, the font size
#
gg1 <- gg + theme(plot.title=element_text(size=30, face="bold"), 
                  axis.text.x=element_text(size=15), 
                  axis.text.y=element_text(size=15),
                  axis.title.x=element_text(size=25),
                  axis.title.y=element_text(size=25)) + 
  scale_color_discrete(name="Cut of diamonds")  # add title and axis text, change legend title.
print(gg1)  # print the plot

##using facet to plot subplots
#seperate the main plot into subplots
#
#use facet_grid(. ~ x-axis-variable), or facet_grid(y-axis-variable ~ .)
#or facet_gird(y-xis-variable ~ x-axis-variable)
gg1+ facet_grid(. ~ cut)
gg1 + facet_grid(clarity ~ cut)

#
gg1+facet_wrap(~ cut)