#### Histogram ####
#Para 1 sola variable categorica
ggplot(data_frame, aes(x = VarNum, fill = VarCat)) + #capa de datos
#data_frame = nuestros datos; VarNum = variable numerica; VarCat = variable categorica
  geom_histogram(aes(y = after_stat(density)), bins = 5, 
                 color = "black") + #capa de "grafico"
                 #bins = numero de barras que tendra el grafico; color = el color de los bordes de dichas barras
  theme_bw() + #añade el tema black and white, que editaremos mas adelante
  theme(axis.title.y = element_text(color = "black"), #axis.title.y = titulo del eje y; element_text = modificamos el texto: color, tamaño de letra, tipografia, etc.
                    axis.text.y = element_blank(),
                    axis.text.x = element_blank(), #element_blank() = elimina todos los argumentos del elemento (lo borra)
                    axis.title.x = element_blank(),
                    axis.ticks.x = element_blank(), #elimina los "ticks"
                    legend.position = "bottom") + #modifica la posicion de la leyenda (right, left, top, bottom, none)
  labs(y = "Titulo del eje y", x = "Titulo del eje x", title = "Titulo del grafico") + #modifica el titulo del grafico
  guides(fill = guide_legend(title = "Titulo de la leyenda")) + #modifica el titulo de la leyenda
  scale_fill_brewer(palette = "Nombre de la Palette") + #colorea el grafico utilizando una paleta
  scale_fill_manual(breaks = c("Grupo 1", "Grupo 2", "..."),
  values=c("Color Grupo 1", "Color Grupo 2", "...")) + #especificamos unos colores personalizados ENTRA EN CONFLICO con la linea anterior (usar solo una)
  facet_grid(VarCat ~ .) #Genera un grafico para cada grupo (si se usa: legend.position = "none)

#### Bar Plot ####
data_sum <- data.summary(data_frame, "VarNum", c("VarCat1", "VarCat2", "...")) #esta funcion genera comparaciones 1 a 1,
                                                                               #si introducimos mas de un grupo deberemos tenerlo en cuenta al generar el grafico
ggplot(data_sum, aes(x = VarCat, y = VarNum, fill = VarCat)) + #capa de datos
#data_sum = nuestros datos; VarNum = variable numerica; VarCat = variable categorica
  geom_col(color = "black") + #capa de "grafico"
  theme_bw() + #añade el tema black and white, que editaremos mas adelante
  theme(axis.title.y = element_text(color = "black"), #axis.title.y = titulo del eje y; element_text = modificamos el texto: color, tamaño de letra, tipografia, etc.
                    axis.text.y = element_text(color = "black"),
                    axis.text.x = element_blank(), #element_blank() = elimina todos los argumentos del elemento (lo borra)
                    axis.title.x = element_blank(),
                    axis.ticks.x = element_blank(), #elimina los "ticks"
                    legend.position = "bottom") + #modifica la posicion de la leyenda (right, left, top, bottom, none)
  labs(y = "Titulo del eje y", x = "Titulo del eje x", title = "Titulo del grafico") + #modifica el titulo del grafico
  guides(fill = guide_legend(title = "Titulo de la leyenda")) + #modifica el titulo de la leyenda
  scale_fill_brewer(palette = "Nombre de la Palette") + #colorea el grafico utilizando una paleta
  scale_fill_manual(breaks = c("Grupo 1", "Grupo 2", "..."),
  values=c("Color Grupo 1", "Color Grupo 2", "...")) + #especificamos unos colores personalizados ENTRA EN CONFLICO con la linea anterior (usar solo una)
  facet_grid(VarCat ~ .) #Genera un grafico para cada grupo (si se usa: legend.position = "none)

##### Box plot #####
ggplot(data_sum, aes(x = VarCat, y = VarNum, fill = VarCat)) + #capa de datos
#data_sum = nuestros datos; VarNum = variable numerica; VarCat = variable categorica
  stat_boxplot(geom = "errorbar", width = 0.15) + #canvia las barras de error (asi le gusta mas a Irene... -_-)
  geom_boxplot(color = "black") + #capa de "grafico"
  theme_bw() + #añade el tema black and white, que editaremos mas adelante
  theme(axis.title.y = element_text(color = "black"), #axis.title.y = titulo del eje y; element_text = modificamos el texto: color, tamaño de letra, tipografia, etc.
                    axis.text.y = element_text(color = "black"),
                    axis.text.x = element_blank(), #element_blank() = elimina todos los argumentos del elemento (lo borra)
                    axis.title.x = element_blank(),
                    axis.ticks.x = element_blank(), #elimina los "ticks"
                    legend.position = "bottom") + #modifica la posicion de la leyenda (right, left, top, bottom, none)
  labs(y = "Titulo del eje y", x = "Titulo del eje x", title = "Titulo del grafico") + #modifica el titulo del grafico
  guides(fill = guide_legend(title = "Titulo de la leyenda")) + #modifica el titulo de la leyenda
  scale_fill_brewer(palette = "Nombre de la Palette") + #colorea el grafico utilizando una paleta
  scale_fill_manual(breaks = c("Grupo 1", "Grupo 2", "..."),
  values=c("Color Grupo 1", "Color Grupo 2", "...")) + #especificamos unos colores personalizados ENTRA EN CONFLICO con la linea anterior (usar solo una)
  facet_grid(VarCat ~ .) #Genera un grafico para cada grupo (si se usa: legend.position = "none)

##### Line Plot #####
ggplot(plot_choline_s, aes(x=pH, y=hydro, group = Enzim, shape=Enzim))+ 
  geom_errorbar(aes(ymin=hydro-se, ymax=hydro+se), width=.1, 
                position=position_dodge(0.05)) +
  geom_line() +
  geom_point(size=2.5)+
  labs(x="pH", y = "Hydrolisi rate (nmol/min/mL Plasma)")+
  theme_bw()

##### Agrupar plots #####
library(ggpubr)
ggarrange(plot1, plot2, labels = c("A", "B"),
          common.legend = TRUE, legend = "bottom")

