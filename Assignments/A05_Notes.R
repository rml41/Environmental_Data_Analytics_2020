Temp_boxplot1 <-
  ggplot(PeterPaul.chem.nutrients, aes(y = temperature_C, x = as.factor(month), color = lakename))+
  geom_boxplot()+
  labs(x = "Month", y = expression("Temperature " ( degree*C)), color = "")+
  scale_color_manual(values = c("#82FF33", "#33ADFF"))+
  theme(legend.position = "none")

TP_boxplot1 <-
  ggplot(PeterPaul.chem.nutrients, aes(x = as.factor(month), y = tp_ug, color = lakename))+
  geom_boxplot()+
  labs(x = "Month", y = expression("Phosphorus" ~ (mu*g / L)), color = "")+
  scale_color_manual(values = c("#82FF33", "#33ADFF"))+
  theme(legend.position = "none")

TN_boxplot1 <- 
  ggplot(PeterPaul.chem.nutrients, aes(y = tn_ug, x = as.factor(month), color = lakename))+
  geom_boxplot()+
  labs(x = "Month", y = expression("Nitrogen" ~ (mu*g / L)), color = "")+
  scale_color_manual(values = c("#82FF33", "#33ADFF"))+
  theme(legend.position = "none")


library(cowplot)
legend <- get_legend(Temp_boxplot + theme(legend.position = "right"))

Temp_NutrientsPlot <- 
  plot_grid(Temp_boxplot1, TP_boxplot1, TN_boxplot1, ncol = 1, align = "v", axis = "ltb", legend, label_size = 6, rel_heights = c(1,1.1))