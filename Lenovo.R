library(twitteR)
setup_twitter_oauth('v4G2SxDIGAdgJonVdpgoXmdZQ','cM58GB3vVuuNscnAJ8uC7UwVpwHHE59WWnBrrV3kyUzY1W8Ak6','146841885-jaZbsQjJrHE6maZhn5nGC0UFNPP6rrULd1DB6C39','56tewGvrNgtcDExLmXGc94dyWWsho14umruVKGyENuW58')
lenovo_health <- searchTwitteR("LenovoHealthUS+@LenovoHealthUS",n=10000,lang = "en")
lenovo_na <- searchTwitter("@LenovoChannelNA",n=10000)

lenovo_health_df <- do.call("rbind", lapply(lenovo_health,as.data.frame))
lenovo_health_df <- subset(lenovo_health_df,select = c(text))

lenovo_na_df <- do.call("rbind",lapply(lenovo_na,as.data.frame))
lenovo_na_df <- subset(lenovo_na_df,select=c(text))

# Cleaning All Tweets

lenovo_health_df$text <- gsub("[[:blank:]]","",lenovo_health_df$text)
lenovo_health_df$text <- gsub("[[:punct:]]","",lenovo_health_df$text)
lenovo_health_df$text <- gsub("[[:ctrl:]]","",lenovo_health_df$text)
lenovo_health_df$text <- gsub("[[:digit:]]","",lenovo_health_df$text)
lenovo_health_df$text = gsub("(RT|via)((?:\\b\\W*@\\w+)+)", " ",  lenovo_health_df$text)
lenovo_health_df$text = gsub("@\\w+", "", lenovo_health_df$text)
lenovo_health_df$text = gsub("http\\w+", "", lenovo_health_df$text)
lenovo_health_df$text = gsub("RT", "", lenovo_health_df$text)
lenovo_health_df$text = gsub("Lenovo", "", lenovo_health_df$text)
lenovo_health_df$text = gsub("HealthUS", "", lenovo_health_df$text)

lenovo_na_df$text <- gsub("[[:blank:]]","",lenovo_na_df$text)
lenovo_na_df$text <- gsub("[[:punct:]]","",lenovo_na_df$text)
lenovo_na_df$text <- gsub("[[:ctrl:]]","",lenovo_na_df$text)
lenovo_na_df$text <- gsub("[[:digit:]]","",lenovo_na_df$text)
lenovo_na_df$text = gsub("(RT|via)((?:\\b\\W*@\\w+)+)", " ",  lenovo_na_df$text)
lenovo_na_df$text = gsub("@\\w+", "", lenovo_na_df$text)
lenovo_na_df$text = gsub("http\\w+", "", lenovo_na_df$text)
lenovo_na_df$text = gsub("RT", "", lenovo_na_df$text)
lenovo_na_df$text = gsub("Lenovo", "", lenovo_na_df$text)
lenovo_na_df$text = gsub("HealthUS", "", lenovo_na_df$text)
lenovo_na_df$text = gsub("ChannelNA", "", lenovo_na_df$text)


lenovo_health_df["DuplicatedTweets"] <- duplicated(lenovo_health_df$text)
lenovo_health_df <- subset(lenovo_health_df,lenovo_health_df$DuplicatedTweets=="FALSE")
lenovo_health_df <- subset(lenovo_health_df,select = c(text))


lenovo_na_df["DuplicatedTweets"] <- duplicated(lenovo_na_df)
lenovo_na_df <- subset(lenovo_na_df,lenovo_na_df$DuplicatedTweets=="FALSE")
lenovo_na_df <- subset(lenovo_na_df,select = c(text))
