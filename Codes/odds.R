#Instalando os Pacotes
install.packages('pinnacle.API')
install.packages('devtools')
devtools::install_github('marcoblume/pinnacle.API')

#Importando os Pacotes
library(pinnacle.API)
AcceptTermsAndConditions(TRUE)
SetCredentials(username ='VT1091964', password ='Xx135xX%')

#VT1091964
#Xx135xX%

#Adquirindo os Dados
sport_data <- GetSports()
head(sport_data)

soccer_id <- with(sport_data, id[name == 'Soccer'])

BasketballOdds <- GetOdds(4)

curl::curl_fetch_memory(url, handle = handle)