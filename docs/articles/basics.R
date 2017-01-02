## ----example1------------------------------------------------------------
library(semver)
examples <- c("1.0.0", "2.1.3", "1.0.0-alpha", "1.0.0-alpha+1.2", 
              "1.8.2-beta.1.13", "1.8.2-beta.1.10")
sem_versions <- parse_version(examples)
sem_versions
str(sem_versions)

## ----example1a-----------------------------------------------------------
render_version(sem_versions[c(1, 4)])
render_version(sem_versions[[5]])
str(render_version(sem_versions[[5]]))

## ----example2------------------------------------------------------------
sem_versions[[1]] <= sem_versions[[5]]
sem_versions[[1]] > sem_versions[[5]]

# compare example 5, 6 (pre-release ordering matters)
sem_versions[[5]] > sem_versions[[6]]

# compare example 3, 4 (build order does not matter)
sem_versions[[3]] == sem_versions[[4]]

## ----example3------------------------------------------------------------
min(sem_versions)
max(sem_versions)
range(sem_versions)

## ----example4------------------------------------------------------------
sort(sem_versions)
order(sem_versions)
rank(sem_versions)

## ----example4a-----------------------------------------------------------
sem_versions > sem_versions[1]


## ----example5------------------------------------------------------------
sem_versions > "1.1.0-beta"
sem_versions[sem_versions > "1.1.0-beta"]

