library(shiny)
library(choroplethr)
library(choroplethrMaps)

shinyServer(function(input, output) {

  output$map <- renderPlot({

    data(df_president_ts)
    df_president_ts = df_president_ts[, c("region", input$year)]
    colnames(df_president_ts) = c("region", "value")
    title = paste0(input$year)
    
    state_choropleth(df_president_ts, title=title)

  })
  
})
