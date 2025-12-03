#Este código nos da la distitribución temporal por intervalo 

ggplot(TablaFinal, aes(x = early_interval, y = edad_promedio)) +
  geom_boxplot() +
  theme_minimal() +
  labs(
    x = "Early Interval",
    y = "Edad promedio (Ma)",
    title = "Distribución temporal por intervalo"
  ) +
  coord_flip()


