# comentarios
x<-3
y<-5*x
z<-c('Hugo','Pacco','Luis')
a<-'alfa'
A<-'Andrés'

library(tidyverse)

mydata <- read.csv("E:/Apps/PRACTICAS/R/edidiv.csv") # en pc \
# nombre<-funcion(dataset, var = nombre, arg = nombre, excepciones)
#mydata_long<-gather(edidiv, key = 'estado', value = 'poblacion', -year)

head(mydata) # 6 primeras filas
tail(mydata) # 6 ultimas filas
str(mydata)   # tipos de vars int chr

head(mydata$taxonGroup) # las 6 de esta col
class(mydata$taxonGroup) # tipo var chr

mydata$taxonGroup <- as.factor(mydata$taxonGroup) 
class(mydata$taxonGroup) # chr convertido a factor

dim(mydata)                 # nº filas y cols
summary(mydata)             # resumen
summary(mydata$taxonGroup)  # resumen de esta var

Beetle <- filter(mydata, mydata$taxonGroup == "Beetle")
Bird <- filter(edidiv, mydata$taxonGroup == "Bird")
#EXACTAMENTE (==) Escarabajo: elimina todo lo demás del conjunto de datos

summary(mydata$taxonGroup) # recordar los nombres
# Beetle             Bird        Butterfly        Dragonfly

# .RBeetledplyrinstall.packages("dplyr")library(dplyr)

chinitas <- length(unique(Beetle)) # diferentes
pajaros <- length(unique(Bird))

#biodiv <- c(a,b,c,d,e,f,g,h,i,j,k) concatenar
biodiv <- c("Beetle",
                   "Bird",
                   "Butterfly",
                   "Dragonfly",
                   "Flowering.Plants",
                   "Fungus",
                   "Hymenopteran",
                   "Lichen",
                   "Liverwort",
                   "Mammal",
                   "Mollusc")

barplot(biodiv)
help()
help(barplot) 
help(par)  
png("barplot.png", width=1600, height=600)

# almacenando los nombres en el objeto taxa
taxa <- c("Beetle",
          "Bird",
          "Butterfly",
          "Dragonfly",
          "Flowering.Plants",
          "Fungus",
          "Hymenopteran",
          "Lichen",
          "Liverwort",
          "Mammal",
          "Mollusc")

taxa_f <- factor(taxa) # convertir en factor (variable categórica)

#richness <- c(a,b,c,d,e,f,g,h,i,j,k)
richness <- c(0,1,2,3,4,5,6,7,8,9,10) #Combinando todos los valores para el número de especies en un objeto

# Creando el marco de datos a partir de los dos vectores.
biodata <- data.frame(taxa_f, richness)

# Guardando el archivo
write.csv(biodata, file="biodata.csv")

# crea gráfico con nombres de columnas y valores cantidad de especies
png("barplot2.png", width=1600, height=600)
barplot(biodata$richness, names.arg=c("Beetle",
                                      "Bird",
                                      "Butterfly",
                                      "Dragonfly",
                                      "Flowering.Plants",
                                      "Fungus",
                                      "Hymenopteran",
                                      "Lichen",
                                      "Liverwort",
                                      "Mammal",
                                      "Mollusc"),
        xlab="Taxa", ylab="Number of species", ylim=c(0,600))
dev.off()

# calcula la media con mean()
sparrow <- mean(22, 24, 21)
kingfisher <- mean(26, 23, 25)
eagle <- mean(195, 201, 185)
hummingbird <- mean(8, 9, 9)

# Encadenarlos en un vector
wingspan <- c(sparrow, kingfisher, eagle, hummingbird)

# Crea un vector de especies de aves
bird_sp <- c("sparrow", "kingfisher", "eagle", "hummingbird")

class(bird_sp)                      # character
bird_sp <- as.factor(bird_sp)       # transformando a factor
class(bird_sp)  # ahora es factor

# Luego, combina los dos vectores en un marco de datos.
wings <- data.frame(bird_sp, wingspan)

# Trazar el diagrama de barras y guardarlo en un archivo
png("wingspan_plot.png", width=800, height=600)
barplot(wings$wingspan, names.arg = wings$bird_sp,xlab = "Bird species", 
        ylab = "Average wingspan (cm)", ylim = c(0, 200), col = "gold"  )
dev.off()
