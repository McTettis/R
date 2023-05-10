#### COMPARING MEANS 2 GROUPS ####

#If parametric:
t.test(VarNum ~ VarCat, data = data_set, paired = FALSE, var.equal = FALSE, alternative = c("two.sided"))
#were: VarNum = variable numerica
#      VarCat = variable categorica
#      data_set = nombre de tus datos
#      paired = si son muestras apareadas = TRUE; si no son muestras apareadas = FALSE
#      var.equal = aplica una correccion al p-value (dejarlo en FALSE)
#      alternative = test de una cola o dos colas (normalmente "two.sided")

#If not-parametric:
wilcox.test(VarNum ~ VarCat, data = data_set, paired = FALSE, alternative = c("two.sided"))
#were: VarNum = variable numerica
#      VarCat = variable categorica
#      data_set = nombre de tus datos
#      paired = si son muestras apareadas = TRUE; si no son muestras apareadas = FALSE
#      alternative = test de una cola o dos colas (normalmente "two.sided")


#### COMPARING MEANS +2 GROUPS ####
#If parametric:
summary(aov(VarNum ~ VarCat, data = data_set))
#were: VarNum = variable numerica
#      VarCat = variable categorica
#      data_set = nombre de tus datos

#If not-parametric:
kruskal.test(VarNum ~ VarCat, data = data_set)
#were: VarNum = variable numerica
#      VarCat = variable categorica
#      data_set = nombre de tus datos

#Post-hoc:
#Para ANOVA (One way):
TukeyHSD(aov(VarNum ~ VarCat, data = data_set))
#Se puede assignar un nombre al modelo anova. Si el modelo se llama "aov1": TukeyHSD(aov1)

#Para Kruskal-Wallis hay dos opciones: Pairwise Wilcox o DunnTest
#Pairwise Wilcox:
pairwise.wilcox.test(data_set$VarNum, data_set$VarCat, p.adjust.method = "BH")
#were: VarNum = variable numerica
#      VarCat = variable categorica
#      data_set = nombre de tus datos
#      p.adjust.method = correccion del p-value. Para ver una lista de todos los posibles algoritmos escribe p.adjust() en la consola

#DunnTest:
dunn.test(data_set$VarNum, data_set$VarCat, kw = FALSE, method = "BH")
#were: VarNum = variable numerica
#      VarCat = variable categorica
#      data_set = nombre de tus datos
#      kw = muestra el resultado del Kruskal-Wallis
#      method = correccion del p-value. Para ver una lista de todos los posibles algoritmos escribe p.adjust() en la consola
