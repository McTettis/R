#### Exercice 1 ####
set.seed(1997)
df1 <- data.frame(
  altura = c(rnorm(100, mean = 176, sd = 10), rnorm(100, mean = 162, sd = 10)),
  sexo = c(rep("male", times = 100), rep("female", times = 100))
)
#df1 contiene unas seqüencias aleatorias que contienen la altura (en cm) de 100 hombres y 100 mujeres

#1. Cread dos data sets, uno con los males y otro con females
library(dplyr)

males <- df1 XXX
XXX(sexo XXX "male")

females <- df1 XXX
XXX(sexo XXX "female")

#2. Cual es la altura promedio de los hombres (en metros)?
library(DataSummary)


#3. Cual es el valor minimo en las mujeres (en metros)?



#4. Grafica la distribucion de los datos en dos histogramas agrupados
#El grafico debe llamarse: Alturas por Sexo
#El eje y no debe tener titulo
#El eje x debe llamarse: Altura (cm)
#Debe poner en la parte inferior: Fuente: la del comedor
#El titulo de la leyenda debe ser: Sexo
#Los hombres deben estar en verde y las mujeres en rosa
#Remplazad SOLO los XXX para obtener el grafico deseado
library(ggplot2)

ggplot(XXX, aes(x = altura, fill = XXX)) + 
  geom_histogram(aes(y = after_stat(density)), bins = 20, 
                 color = "black") + 
  theme_bw() + 
  theme(axis.title.y = XXX, 
        axis.text.y = element_text(color = "black"),
        axis.text.x = element_text(color = "black"), 
        XXX = "bottom") + 
  XXX(x = "Altura (cm)", title = "XXX",
       XXX = "Fuente: la del comedor") + 
  guides(fill = guide_legend(XXX = "Sexo")) + 
  XXX(breaks = c("male", "female"),
                    values = XXX("green", "pink")) + 
  XXX(sexo ~ .)



#5. Comprobad usando un test de shapiro lo normalidad de ambos sexos

XXX(males$XXX)
XXX(females$XXX)

#6. Comprobad la homogenidad de variancias
library(car)

leveneTest(XXX ~ XXX, XXX = df1)

#7. Utiliza el test apropiado para comprovar si existen diferencias significativas

XXX(altura ~ XXX, XXX = df1, paired = XXX, var.eq = XXX)

#8. Cread un grafico de barras con la desviacion estandard (SD)
ggplot(XXX, aes(x = sexo, y = altura, fill = XXX)) + 
  geom_col(color = "black") + 
  XXX(aes(XXX = VarNum - XXX, ymax = XXX + SD), width=.1, 
                position=position_dodge(0.05)) +
  theme_bw() + 
  theme(axis.text.XXX = element_text(color = "black"),
        axis.text.XXX = element_text(color = "black"),
        axis.title.x = element_blank(),
        legend.position = "bottom") + 
  XXX(y = "Altura (cm)", title = "Alturas por sexos") + 
  guides(fill = guide_legend(title = "Sexo")) + 
  scale_fill_XXX(breaks = c("male", "female"),
                    values=c("green", "pink"))