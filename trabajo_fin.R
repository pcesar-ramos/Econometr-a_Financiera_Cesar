##########################################
###        Tarea - sesión 1            ###
##########################################
###         Paulo Cesar Ramos          ###
##########################################

# Paso 1 Instalar los paquetes librerias
  #install.packages("quatmode")
  #install.packages("PerformanceAnalytics")

# Llamando librerías
  library(quantmod)
  library(PerformanceAnalytics)
  library(tseries)

# Descargando datos de Yahoo Finance
  getSymbols.yahoo('MSFT', env = globalenv(), return.class = "xts",
                   from = '2002-01-01', to = Sys.Date(),
                   periodicity = 'monthly')
                   
  getSymbols.yahoo('WTI', env = globalenv(), return.class = 'xts',
                   from = '2000-01-01', to = Sys.Date(), 
                   periodicity = 'daily')
  
  getSymbols.yahoo('APPL', env = globalenv(), return.class = "xts",
                   from = '2002-01-01', to = Sys.Date(),
                   periodicity = 'daily')
  
# Charting
  chartSeries(WTI, theme = "black")
  chartSeries(WTI, type = "candlesticks", theme = "white", 
              TA = 'addBBands(); addBBands(draw="p"); addVo();
              addMACD(); addRSI(); addSMA()', 
              subset = 'last 50 weeks')
  
# Gráficos combinados
  par(mfrow=c(2,2))
  chartSeries(WTI, theme = "grey")
  chartSeries(MSFT, theme = "white")
  chartSeries(WTI, theme = "black")
  chartSeries(MSFT, theme = "red")  
  
# help("chartSeries")
  
# Utilizando librería Performance Analytics
  par(mfrow=c(2,2))
  chart.TimeSeries(WTI$WTI.Adjusted, main = "WTI", element.color = "darkgray")  
  chart.TimeSeries(MSFT$MSFT.Adjusted, main = "WTI_ad", grid.color = "lightgray")  
  chart.TimeSeries(APPL$APPL.Adjusted, main = "WTI_guau", ylab = "Price")  
  chart.TimeSeries(WTI$WTI.Adjusted, main = "WTI_close", xlab = "Tiempo") 
  
# Calculando retornos
  MSFT_Ret = Return.calculate(MSFT$MSFT.Adjusted, method = "compound")
  MSFT_Ret = MSFT_Ret[-1,]

  chart.TimeSeries(MSFT_Ret, main="Retornos de Microsoft")
  
  acf(MSFT_Ret)
  pacf(MSFT_Ret)