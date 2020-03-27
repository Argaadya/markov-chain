# Learn By Building Markov Chain

Create random sentences by making a text generator using the `theoffice` dataset from `schrute` package. The dataset is consists of dialogue transcript from `The Office` series throughout all seasons. You may also use your own choice of dataset. The rubrics for the LBB are as follows:

## Input Data

(1) Since Markov Chains may use considerable amount of time to create, you may need to downsize the data first. 

  - How many obsevations do you use?
  - How do you filter the data?

## Data Preprocessing

(1) Cleanse the text properly before putting it into Markov Chains

  - What processing step do you use to clean the data?
  - Do you need to remove punctuation?
  - Do you need to remove numbers?

(1) Tokenization

  - do you split the text into a 1-gram token? 2-gram or 3-gram token?
  - what function do you use to tokenize the text?

## Model Fitting

(1) Fit the text vector into Markov Chains

  - Is there any step that you should do before fitting the text into Markov Chains?
  - What method do you use? Do you use laplace smoothing?
  
## Build the text generator

(1) Generate 10 random sentences using the Markov Chains that you have created earlier

  - How many words do you use to create the sentence?
  - What is the first word(s) you use to start the sentence
