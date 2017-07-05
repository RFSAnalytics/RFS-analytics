

# Libraries needed

require(readxl)
require(xlsx)
require(tm)
require(NLP)
require(wordcloud)


## Reading the file

RFS_total_file <- read_excel("C:/Users/kurbina/Desktop/RFS Description.xlsx")

## Converting the file to a data frame 

RFS_total_file<- as.data.frame(RFS_total_file)


## Manage the file with VCorpus in order to make easier to clean
Bodycorpus<-VCorpus(VectorSource(RFS_total_file))

## Cleaning the text 
Bodycorpus<- tm_map(Bodycorpus, tolower)
Bodycorpus<- tm_map(Bodycorpus, removePunctuation)
Bodycorpus<- tm_map(Bodycorpus, removeNumbers)
Bodycorpus<- tm_map(Bodycorpus, stripWhitespace)
Bodycorpus<- tm_map(Bodycorpus, PlainTextDocument)


## Making a word cloud but with stopping words

wordcloud(Bodycorpus, max.words = 100, random.order = FALSE, colors = brewer.pal(8,"Dark2"))


## Removing the stopping words

BodycorpusnoSW<- tm_map(Bodycorpus, removeWords, stopwords("english"))

## Making a word cloud without the stopping words

wordcloud(BodycorpusnoSW, max.words = 100, random.order = FALSE,colors = brewer.pal(8,"Dark2") )


