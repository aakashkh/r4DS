library(tidyverse)
mpg
ggplot(data = mpg)+
  geom_point(mapping = aes(x=displ,y=hwy))

#Excersize
ggplot(data = mpg)+
  geom_point(mapping = aes(x=class,y=drv))

ggplot(data = mpg)+
  geom_point(mapping = aes(x=displ,y=hwy, color = class))


ggplot(data = mpg)+
  geom_point(mapping = aes(x=displ,y=hwy, size = class))

ggplot(data = mpg)+
  geom_point(mapping = aes(x=displ,y=hwy, alpha = class))

ggplot(data = mpg)+
  geom_point(mapping = aes(x=displ,y=hwy, shape = class))
  
ggplot(data = mpg)+
  geom_point(mapping = aes(x=displ,y=hwy), color = "blue")

#Logical statement as legend = True or False
ggplot(data = mpg)+
  geom_point(mapping = aes(x=displ,y=hwy, colour = displ < 5))
?geom_point

#Stroke = width of border
ggplot(mtcars, aes(wt, mpg)) +
  geom_point(shape = 21, colour = "black", fill = "white", size = 5, stroke = 1)

#Facets
ggplot(data = mpg)+
  geom_point(mapping = aes(x = displ, y = hwy))+
  facet_wrap(~ class, nrow = 3)


ggplot(data = mpg)+
  geom_point(mapping = aes(x = displ, y = hwy))+
  facet_grid(drv ~ cyl)

ggplot(data = mpg)+
  geom_point(mapping = aes(x = displ, y = hwy))+
  facet_grid(. ~ displ)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg)+
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))

ggplot(data = mpg)+
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv)) + 
  geom_point(aes(x = displ, y = hwy,col = drv))



ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv))

ggplot(data = mpg) +
  geom_smooth(
    mapping = aes(x = displ, y = hwy, color = drv),
    show.legend = FALSE
  )

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth()


ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) +
  geom_smooth(data = filter(mpg, class == "suv"), se = F) + geom_smooth(data = filter(mpg, class == "2seater"), se = F) 



ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) + 
  geom_point() + 
  geom_smooth(se = FALSE)


ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth()

ggplot() + 
  geom_point(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_smooth(data = mpg, mapping = aes(x = displ, y = hwy))

ggplot(mpg, aes(x = displ, y = hwy, fill = drv)) +
  geom_point(color = "white", shape = 21, stroke = 2, size = 3)





ggplot(data = diamonds) + geom_bar(aes(x = cut))
demo <- tribble(
  ~cut,         ~freq,
  "Fair",       1610,
  "Good",       4906,
  "Very Good",  12082,
  "Premium",    13791,
  "Ideal",      21551
)
ggplot(data = demo) +
  geom_bar(mapping = aes(x = cut, y = freq), stat = "identity")


ggplot(data = demo) +
  geom_bar(mapping = aes(x = cut, y = freq))

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x= cut, y= ..prop.., group =2))
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = color, y = ..prop.., group=1))

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x= cut, colour = cut))


ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x= cut, fill = cut))

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, color = cut))

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = cut))

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = clarity))

plt <- ggplot(data = diamonds)
plt+ geom_bar(aes(x=cut,fill=clarity), alpha = 0.2,position = "identity")
plt + geom_bar(aes(x=cut), position =  "identity")

ggplot(data = diamonds, mapping = aes(x = cut, colour = clarity)) + 
  geom_bar(fill = NA, position = "identity")

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "fill")

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x=cut,fill = clarity), position = "dodge")

ggplot(data=mpg) + 
  geom_point(aes(x = displ, y = hwy), position = "jitter")

ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
  geom_point() +
  geom_jitter()

ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
  geom_point() +
  geom_count()

ggplot(data = mpg ) + 
  geom_boxplot(aes(x = class, y = displ))+ geom_jitter(width = 0.2)

p <- ggplot(mpg, aes(class, hwy))
p + geom_boxplot()
p + geom_boxplot(position = "jitter")

ggplot(data=mpg, mapping = aes(x = class, y = hwy)) +
  geom_boxplot()

ggplot(data=mpg, mapping = aes(x = class, y = hwy))+
  geom_boxplot()+coord_flip()

nz <- map_data("nz")
ggplot(nz, aes(long,lat,group = group))+
  geom_polygon(fill = "white", col = "black")

ggplot(nz, aes(long, lat, group = group)) +
  geom_polygon(fill = "white", colour = "black") +
  coord_quickmap()

bar <- ggplot(data = diamonds) + 
  geom_bar(
    mapping = aes(x = cut, fill = cut), 
    show.legend = FALSE,
    width = 1
  ) + 
  theme(aspect.ratio = 1) +
  labs(x = NULL, y = NULL)

bar + coord_flip()
bar + coord_polar()

ggplot(mpg, aes(factor(1), fill = cyl)) +
  geom_bar(width = 1) +
  coord_polar()


ggplot(mpg) +
  geom_bar(aes(factor(1), fill = factor(cyl)), width = 1) +theme(aspect.ratio = 1)+
  coord_polar()


ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = cut))+coord_polar()

ggplot(mpg, aes(factor(1), fill = factor(cyl))) +
  geom_bar(width = 1) +
  coord_polar(theta = 'y')

ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_point() + 
  geom_abline() +
  coord_fixed()


nz <- map_data("nz")

nzmap <- ggplot(nz, aes(x = long, y = lat, group = group)) +
  geom_polygon(fill = "white", colour = "black")

nzmap + coord_map()
nzmap + coord_quickmap()


