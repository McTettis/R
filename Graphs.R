#### Histogram ####
#Para 1 sola variable categorica
ggplot(data_frame, aes(x = VarNum)) + 
  geom_histogram(aes(y = after_stat(density)), colour= "black", fill= "white") +
  geom_density(alpha = .2, fill = "#FF6666") #Esta linea añade la desidad en el grafico


#Para 2 o mas variables categoricas
ggplot(data_frame, aes(x = VarNum, fill = VarCat, color = VarCat)) +
  geom_histogram(position = "identity", alpha = 1)

ggplot(data_frame, aes(x = VarNum, fill = VarCat)) + 
  geom_histogram(aes(y = after_stat(density)), colour= "black") +
  facet_grid(VarCat ~ .)

#### Bar Plot ####
ggplot(prc_s, aes(x= pH, y=hydr)) + 
  geom_bar(stat="identity", color="black", 
           position=position_dodge()) +
  geom_errorbar(aes(ymin=hydr, ymax=hydr+se), width=.2,
                position=position_dodge(.9)) +
  labs(x="pH", y = "PrC hydrolisi rate (nmol/min/mL plasma)") + theme_classic() +
  theme(text = element_text(size = 12), axis.text.x = element_text(colour = "black"), axis.text.y = element_text(colour = "black"))

##### Line Plot #####
ggplot(plot_choline_s, aes(x=pH, y=hydro, group = Enzim, shape=Enzim))+ 
  geom_errorbar(aes(ymin=hydro-se, ymax=hydro+se), width=.1, 
                position=position_dodge(0.05)) +
  geom_line() +
  geom_point(size=2.5)+
  labs(x="pH", y = "Hydrolisi rate (nmol/min/mL Plasma)")+
  theme_bw()

##### Box plot #####
ggplot(df, aes(x=E_S, y=pNPA)) +
  geom_boxplot(fill='#A4A4A4', color="black")+
  labs(y = "pNPA hydrolisi rate (nmol/min/mL Plasma)")+ theme_bw()+
  theme(text = element_text(size = 14), axis.text.x = element_text(colour = "black"), axis.text.y = element_text(colour = "black")) 

##### Agrupar plots #####
library(ggpubr)
ggarrange(plot1, plot2, labels = c("A", "B"),
          common.legend = TRUE, legend = "bottom")

