library(dplyr)
library(readr)

# 1. Cargar quitando las líneas iniciales de metadata de PBDB
DatosReef1 <- read_csv("pbdb_data_sponges1.csv", skip = 18)

# 2. Pipeline completo de organización de la base
TablaFinal <- DatosReef1 %>%
  
  # Seleccionar solo las columnas útiles
  select(
    occurrence_no,
    accepted_name,
    accepted_rank,
    early_interval,
    late_interval,
    max_ma,
    min_ma,
    reference_no
  ) %>%
  
  # 3. Limpiar nombre de taxón
  mutate(
    accepted_name = trimws(accepted_name),
    accepted_name = tolower(accepted_name)
  ) %>%
  
  # 4. Crear edad promedio para análisis
  mutate(
    edad_promedio = (max_ma + min_ma) / 2
  ) %>%
  
  # 5. Ordenar por edad (más antiguo → más joven)
  arrange(desc(edad_promedio))

