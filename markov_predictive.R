# Data wrangling
library(tidyverse)

# Text processing
library(tidytext)
library(textclean)
library(tokenizers)

# Markov Chain
library(markovchain)

library(tokenizers)

predictive_text <- function(text, num_word){
  
  word_count <- count_words(text)
  
  # Check if it has 3 or more words
  if (word_count >= 3) {
    input_text <- strsplit(text, " ") %>% unlist() %>% tail(3) %>% paste(collapse = " ")
    
    # If cannot find the transition in trigram
    if (isTRUE(tryCatch(markov_trigram$estimate[ input_text, ], error = function(e) 1) == 1)) {
      
      input_text <- strsplit(text, " ") %>% unlist() %>% tail(2) %>% paste(collapse = " ")
      
      # If cannot find the transition in bigram
      if (isTRUE(tryCatch(markov_bigram$estimate[ input_text, ], error = function(e) 1) == 1)) {
        
        input_text <- strsplit(text, " ") %>% unlist() %>% tail(1) %>% paste(collapse = " ")
        
        fit_markov$estimate[ tolower(input_text), ] %>%
          sort(decreasing = T) %>% 
          head(num_word) %>% 
          names() 
      } else {
        
        # Can find the transition in bigram
        markov_bigram$estimate[ tolower(input_text), ] %>%
          sort(decreasing = T) %>% 
          head(num_word) %>% 
          names() %>%
          str_extract(pattern = "\\s(.*)") %>% 
          str_remove("[ ]")
      }
    } else {
      
      # Can find the transition in trigram
      markov_trigram$estimate[ tolower(input_text), ] %>%
        sort(decreasing = T) %>% 
        head(num_word) %>% 
        names() %>%
        str_extract(pattern = "\\s(.*)") %>% 
        str_remove("[ ]") %>%  
        str_extract(pattern = "\\s(.*)") %>% 
        str_remove("[ ]") 
    }
    
  } else {
    
    # Check if the words is 2 or more
    if (word_count >= 2) {
      
      input_text <- strsplit(text, " ") %>% unlist() %>% tail(2) %>% paste(collapse = " ")
      
      # If cannot find the transition in bigram
      if (isTRUE(tryCatch(markov_bigram$estimate[ input_text, ], error = function(e) 1) == 1)) {
        
        input_text <- strsplit(text, " ") %>% unlist() %>% tail(1) %>% paste(collapse = " ")
        
        fit_markov$estimate[ tolower(input_text), ] %>%
          sort(decreasing = T) %>% 
          head(num_word) %>% 
          names() 
      } else{
        
        # Can find the transition in bigram
        markov_bigram$estimate[ tolower(input_text), ] %>%
          sort(decreasing = T) %>% 
          head(num_word) %>% 
          names() %>%
          str_extract(pattern = "\\s(.*)") %>% 
          str_remove("[ ]")
      }
      
    } else {
      
      # If only has 1-gram
      input_text <- strsplit(text, " ") %>% unlist() %>% tail(1) %>% paste(collapse = " ")
      
      # exclude punctuation
      punctuation <- which(fit_markov$estimate[ tolower(input_text), ] %>% names() %>% str_detect("[:punct:]"))
      fit_markov$estimate[ tolower(input_text), -punctuation] %>%
        sort(decreasing = T) %>% 
        head(num_word) %>% 
        names() 
    }
    
  }
}