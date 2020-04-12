# DAG Examples
# Fuente https://cran.r-project.org/web/packages/ggdag/vignettes/intro-to-dags.html
#  set theme of all DAGs to `theme_dag()`
library(ggdag)
theme_set(theme_dag())
# Basic edge
dagify(y ~ x) %>% 
  ggdag()
#  canonicalize the DAG: Add the latent variable in to the graph
dagify(y ~~ x) %>% 
  ggdag_canonical() 
# Cyclic graph
dagify(y ~ x,
       x ~ a,
       a ~ y) %>% 
  ggdag() 
# Structural causal model
smoking_ca_dag <- dagify(cardiacarrest ~ cholesterol,
                         cholesterol ~ smoking + weight,
                         smoking ~ unhealthy,
                         weight ~ unhealthy,
                         labels = c("cardiacarrest" = "Cardiac\n Arrest", 
                                    "smoking" = "Smoking",
                                    "cholesterol" = "Cholesterol",
                                    "unhealthy" = "Unhealthy\n Lifestyle",
                                    "weight" = "Weight"),
                         latent = "unhealthy",
                         exposure = "smoking",
                         outcome = "cardiacarrest")

ggdag(smoking_ca_dag, text = FALSE, use_labels = "label")
