library(dplyr)
library(ggplot2)

#Aquí se grafica el PCA con los datos de PCAdatos1.R
Abundancia <- TablaFinal %>%
  mutate(
    nivel = ifelse(accepted_rank == "genus", "genus",
                   ifelse(accepted_rank == "species", "species", NA))
  ) %>%
  filter(!is.na(nivel)) %>%
  group_by(early_interval, nivel) %>%
  summarise(n = n(), .groups = "drop")

Abundancia_wide <- Abundancia %>%
  tidyr::pivot_wider(
    names_from = nivel,
    values_from = n,
    values_fill = 0
  )

ggplot(Abundancia_wide, aes(x = genus, y = species, label = early_interval)) +
  geom_point(size = 4) +
  geom_text(vjust = -0.6, size = 4) +
  labs(
    x = "Abundancia de géneros",
    y = "Abundancia de especies",
    title = "Diversidad por early_interval: Géneros vs Especies"
  ) +
  theme_minimal()
