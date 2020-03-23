# Markov Chains Quiz

## General Concept

This section will assess your general understanding of Markov Chains
___
1. What is **NOT** the characteristics of Markov Chains?
   - [ ] It has a matrix that consists of transition probability between states
   - [ ] Lack of memories
   - [ ] The next state can be influenced by the previous 5 states
___

At the end of each week t (Saturday night), an electronic store places an order that is delivered in time for the next opening of the store on Monday. The store uses the following order policy:
If Xt = 0, order 3 cameras.
If Xt > 0, do not order any cameras.

Thus, the inventory level fluctuates between a minimum of zero cameras and a maximum of three cameras, so the possible states of the system at time t (the end of week t) are as follows:

Possible states:  0, 1, 2, or 3 cameras on hand. 

The transition matrix based on the historical data is as follows:

![Transition Matrix](https://github.com/Argaadya/markov-chain/blob/master/asset/matrix.PNG)

Transform the matrix into Markov Chains model 
```
transitionmatrix <- matrix(c(0.08, 0.184, 0.368, 0.368,
                      0.632, 0.368, 0, 0,
                      0.264, 0.368, 0.368, 0,
                      0.08, 0.184, 0.368, 0.368),
                      byrow = T, nrow = 4)

# Transform into markovchain object

## your code here
```

Use `absorbingStates()` function to get the absorbing state of the previous Markov Chains. 

```
# your code here
```

___
2. What is the implication of the presence of absorbing state?
   - [ ] Once it enter the absorbing state it cannot leave those state
   - [ ] Once it enter the absorbing state it will never return to those state
   - [ ] Regardless of the previous state, the probability will always be the same
___

Steady-states is a condition where the probability for the next state is identical, regardless of the current state. You can use `steadyStates()` function to acquire the steady state probability for each state.

```
# your code here
```

___
3. What is the steady-state probability for state 3 (3 cameras on hand)?
   - [ ] 0.285
   - [ ] 0.284
   - [ ] 0.166
___


The manager want to know what is the probability that we will have 3 cameras on hand at the next 3 days if today all cameras have been sold an we have no cameras on hand.

```
# your code here
```

___
4. Calculate the probability of state 3 at the next 3 step if the current state is 0
   - [ ] 0.152
   - [ ] 0.292
   - [ ] 0.293
___

## Text Generator

Markov Chains can also be employed as a text generator.
___
5. What is NOT the characteristics of using Markov Chains for text generation?
   - [ ] It calculate the transition probability between terms
   - [ ] It can understand the context of a sentence using N-grams Markov Chains
   - [ ] It can understand a context even if we only use an 1-gram Markov Chains
___

We will try to create a text generator using the dialogue script from the tv series `The Office (US)` from the `schrute` package. The data description is as follows:

```
library(schrute)

head(theoffice)
```

* `index`: row index
* `season`: the season index
* `episode`: the episode index
* `episode_name`: name of the episode
* `director`: the director of the episode
* `writer`: the script writer of the episode
* `character`: the character that read the text dialogue
* `text`: the text of the dialogue
* `text_w_direction`: text with the stage direction (cue)
* `imdb_rating`: the IMBD rating for the episode
* `total_votes`: total votes for the episode
* `air_date`: the first airing/broadcast of the episode

Since the data is big, we will only use the script from the first season to cut the computation time. So the first we need to do is to filter the data to cover only text from the season 1. After that, use the following text preprocessing for the column `text`:

* make all string lowercase
* remove all punctuation
* remove all numbers
* replace word contraction
* remove double whitespace

```
# your code here
```

After you have completed the text preprocessing, the next step is to split each dialogue sentence into a single term using the `strsplit()` function for the `text` column. To make the list of the word into a vector, use `unlist()`. Create a Markov Chains by using `markovchainFit()` with the text vector as the input and store it as `fit_office`.

```
# your code here

fit_office <- ...
```

Use set.seed(123) and create a predictive text function to predict the next word.

```
predictive_text <- function(text, num_word){
   text <- strsplit(text, " ") %>% unlist() %>% tail(1)
   
   fit_office$estimate[ tolower(text), ] %>%
   sort(decreasing = T) %>% 
   head(num_word) %>% 
   names()
}

set.seed(123)
predictive_text( ... , ...)
```

___
6. What is the top 3 word suggestion if we type the word "you"?
   - [ ] know, should, do
   - [ ] should, can, have
   - [ ] are, can, know
___
