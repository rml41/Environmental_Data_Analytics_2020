### Interaction
Nitrogen.interaction <- with(Lake.Nutrients.Surface, interaction(month, lakename))

Nitrogen.anova.2way3 <- aov(data = Lake.Nutrients.Surface, tn_ug ~ Nitrogen.interaction)
summary(Nitrogen.anova.2way3)

Nitrogen.groups <- HSD.test(Nitrogen.anova.2way3, "Nitrogen.interaction", group = TRUE)
Nitrogen.groups


Phosphorus.anova.plot <- ggplot(Lake.Nutrients.Surface, 
                                aes(y = tp_ug, x = month, color = lakename)) +
  geom_boxplot()+
  stat_summary (geom = "text", fun.y = max, vjust = -1, size = 3.5,
                label = c ("cd","bcd","d","ab","d","a","d","abc","cd","abcd"), 
                position = position_dodge(0.75),
                show.legend = FALSE) +
  scale_color_viridis_d(option = "magma", begin = 0.3, end = 0.8)+
  ylim(0,75)+
  theme(legend.position = "top")+
  labs(x = "Month", y = expression(TP ~ (mu*g / L)), color = "")
print(Phosphorus.anova.plot)

### second graph with no legends for cowplot 
Phosphorus.anova.plot2 <- ggplot(Lake.Nutrients.Surface, 
                                 aes(y = tp_ug, x = month, color = lakename)) +
  geom_boxplot()+
  stat_summary (geom = "text", fun.y = max, vjust = -1, size = 3.5,
                label = c ("cd","bcd","d","ab","d","a","d","abc","cd","abcd"), 
                position = position_dodge(0.75),
                show.legend = FALSE) +
  scale_color_viridis_d(option = "magma", begin = 0.3, end = 0.8)+
  ylim(0,75)+
  theme(legend.position = "none")+
  labs(x = "Month", y = expression(TP ~ (mu*g / L)), color = "")