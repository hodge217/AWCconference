library(dplyr)

# Let's get the individual genres for each person
fiction_genres <- strsplit(Nov_1_2_Conference_Registrations$`What fiction genre(s) do you write?`, split=", ")
fiction_genres <- lapply(fiction_genres, as.data.frame)

fiction <- purrr::list_rbind(fiction_genres) %>% unique()
write.csv(fiction, file="list_of_fiction_genres.csv")


# Non fiction
nonfiction_topics <- strsplit(Nov_1_2_Conference_Registrations$`What nonfiction topic(s) do you write?`, split=", ")
nonfiction_topics <- lapply(nonfiction_topics, as.data.frame)

nonfiction <- purrr::list_rbind(nonfiction_topics) %>% unique()
write.csv(nonfiction, file="list_of_nonfiction.csv")
