
#deploy to shinyapps.io
#first you will need an account

install.packages('rsconnect')

#name is account name, get both your authentication token and secret in your account
rsconnect::setAccountInfo(name='nlangholz',
                          token='<hide>',
                          secret='<SECRET>')

#setwd("~Users/Documents/UCLA/shiny-app-418")
library(rsconnect)
rsconnect::deployApp(appDir = 'docker/',appName="clusters")

#this is now running at
#https://nlangholz.shinyapps.io/clusters/