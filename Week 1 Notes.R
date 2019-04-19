#Exploratory Data Analysis

#Exploratory Graphs

#why do we use graphs in data analysis? understand data properties, find data patterns, suggest modeling strategies, "debug" analyses, communicate results

library(datasets)
data("cars")
with(cars, plot(speed, dist))

#lattice
install.packages("lattice")
library(lattice)
state <- data.frame(state.x77, region = state.region)
xyplot(Life.Exp ~ Income | region, data = state, layout = c(4,1))

##ggplot
library(ggplot2)
data("mpg")
qplot(displ, hwy, data = mpg)

#Base Plotting System in R

#base graphs: plot, hist, boxplot
#lattice: xyplot, bwplot, levelplot

library(datasets)
airquality <- transform(airquality, Month = factor(Month))
boxplot(Ozone ~ Month, airquality, xlab = "Month", ylab = "Ozone")

#Important base graphics parameters

#pch = plotting symbol
#lty = line type
#lwd = line width
#col = plotting color
#xlab = x axis
#y lab = y axis

#par function is used to specify global graphics parameters
#las = orientation of axis labels on the plot
#bg = background color
#mar = margin size
#oma = outer margin size
#mfrow = number of plots per row
#mfcol = number of plots per row

#default parameters
par("lty")
par("col")
par("pch")
par("bg")
par("mar")
par("mfrow")

#base plotting system (part 2)

#base plotting functions

#plot = scatterplot, other types of plots depending on class of object
#lines = add lines to a plot
#points = add points to a plot
#text = add text labels using specified x,y coordinates
#title = adds titles
#mtext = add arbitrary text to margins
#axis = adding axis ticks/labels

#base plot w/annotation

library(datasets)
with(airquality, plot(Wind, Ozone))
title(main = "Ozone and Wind in NYC")

with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in NYC"))
with(subset(airquality, Month ==5), points(Wind, Ozone, col = "blue"))

with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in NYC"))
with(subset(airquality, Month ==5), points(Wind, Ozone, col = "blue"))
with(subset(airquality, Month != 5), points(Wind, Ozone, col = "red"))
legend("topright", pch = 1, col = c("blue", "red"), legend = c("May", "Other Months"))

#base plot with reg line

with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in NYC", pch = 20))
model <- lm(Ozone ~ Wind, airquality)
abline(model, lwd = 2)

#multiple base plots

par(mfrow = c(1,2))
with(airquality, {
  plot(Wind, Ozone, main = "Ozone and Wind")
  plot(Solar.R, Ozone, main = "Ozone and Solar Radiation")
  })

par(mfrow = c(1,3), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(airquality, {
  plot(Wind, Ozone, main = "Ozone and Wind")
  plot(Solar.R, Ozone, main = "Ozone and Solar Radiation")
  plot(Temp, Ozone, main = "Ozone and Temperature")
  mtext("Ozone and Weather in NYC", outer = TRUE)
})

#outer is a label that goes over all plots


#base plotting demonstration
x <- rnorm(100)
y <- rnorm(100)
z <- rnorm(100)
hist(x)

plot(x,y)
plot(x, z)

par(mar = c(2,2,2,2))
plot(x,y)

par(mar = c(4,4,2,2))

plot(x, y, pch = 20)
plot(x, y, pch = 19)

example(points)

plot(x,y)
title("Scatterplot")
text(-2, -2, "Label")
legend("topleft", legend = "data")
fit <- lm(y ~x)
abline(fit)
abline(fit, lwd = 3)
abline(fit, lwd = 3, col = "blue")

plot(x, y, xlab = "Weight", ylab = "height", main = "Scatterplot", pch = 20)
legend("topright", legend = "Data", pch = 20)
fit <- lm(y~x)
abline(fit, lwd = 3, col = "red")

z <- rpois(100, 2)

par(mfrow = c(2,1))

plot(x,y, pch = 20)
plot(x, z, pch = 19)

par("mar")

par(mar = c(2,2,1,1))

par(mfrow = c(2,2))
plot(x,y)
plot(y,x)
plot(y,z)
plot(x,z)

#points function - how to annotate a plot

par(mfrow = c(1,1))

x <- rnorm(100)
y <- x + rnorm(100)
g <- gl(2,50, labels = c("Male", "Female"))
plot(x,y)

plot(x,y, type = "n")
#data is not there

#add data one group at a time

#represent male points
points(x[g == "Male"], y[g == "Male"], col = "blue", pch = 19)
#represent female
points(x[g == "Female"], y[g == "Female"], col = "pink", pch = 3)

#graphics devices in R

library(datasets)
with(faithful, plot(eruptions, waiting))
title(main = "Old Faithful Geyser data")













































