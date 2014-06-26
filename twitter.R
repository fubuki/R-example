library(twitteR)

cred <- OAuthFactory$new(consumerKey=my.key,
  consumerSecret=my.secret,
  requestURL='https://api.twitter.com/oauth/request_token',
  accessURL='https://api.twitter.com/oauth/access_token',
  authURL='https://api.twitter.com/oauth/authorize')
  
cred$handshake(cainfo="C:/.../cacert.pem")

save(cred, file="twitter authentication.Rdata")

registerTwitterOAuth(cred)
bigdata <- searchTwitter("#bigdata", n=1500, cainfo="cacert.pem")


bigdata.df <- do.call(rbind, lapply(bigdata, as.data.frame))
