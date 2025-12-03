ggplot(TablaFinal, aes(x = edad_promedio, y = accepted_name)) +
  geom_point(alpha = 0.4) +
  labs(
    x = "Edad promedio (Ma)",
    y = "Taxón",
    title = "Distribución temporal de taxones"
  ) +
  theme_minimal()

