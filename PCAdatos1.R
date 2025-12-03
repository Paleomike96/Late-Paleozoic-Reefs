PCA_data <- TablaFinal %>%
  select(max_ma, min_ma, edad_promedio) %>%
  na.omit()

PCA_res <- prcomp(PCA_data, scale. = TRUE)
summary(PCA_res)

biplot(PCA_res, cex = 0.7)


#Esto nos genera los datos para el PCA de prueba
