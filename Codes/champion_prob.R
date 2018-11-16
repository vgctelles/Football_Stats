#Funcao de Formatacao de Numero
percent <- function(x, digits = 2, format = "f", ...) {
  paste0(formatC(100 * x, format = format, digits = digits, ...), "%")
}

#Importacao de Dados
hist = read.csv(file.choose(), sep = ";", header = T)
predActual = read.csv(file.choose(), sep = ";", header = T)

#Checagem das Correlacoes
cor(hist$Points, hist$FLG_Sucess_Champ)
cor(hist$Qty_match_home_L6, hist$FLG_Sucess_Champ)
cor(hist$Qty_match_away_L6, hist$FLG_Sucess_Champ)
cor(hist$Qty_match_home_T7_T14, hist$FLG_Sucess_Champ)
cor(hist$Qty_match_away_T7_T14, hist$FLG_Sucess_Champ)
cor(hist$Qty_match_home_T6, hist$FLG_Sucess_Champ)
cor(hist$Qty_match_away_T6, hist$FLG_Sucess_Champ)

#Criacao do Modelo
modBrasileirao = glm(FLG_Sucess_Champ ~ Points+Qty_match_home_L6, data = hist, family = "binomial")


plot(hist$Points, hist$FLG_Sucess_Champ, col = 'red', pch = 20)
points(hist$Points, modBrasileirao$fitted.values, pch = 4)

predActual$Pred_FLG_Sucess_Champ = predict(modBrasileirao, newdata = predActual, type = "response")

predActual$Pred_FLG_Sucess_Champ = percent(predActual$Pred_FLG_Sucess_Champ)


