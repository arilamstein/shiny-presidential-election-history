library(shiny)
library(choroplethr)
library(choroplethrMaps)

shinyServer(function(input, output) {

  output$map <- renderImage({

    year = as.character(input$year)
    filename = paste0("year", "-", year, ".png")

    # if cache exists, return the cache
    if (file.exists(filename))
    {
      list(src         = filename,
           contentType = 'image/png',
           width       = 640,
           height      = 480,
           alt         = filename)
    } else {
      
      data(df_president_ts)
      df_president_ts = df_president_ts[, c("region", input$year)]
      colnames(df_president_ts) = c("region", "value")
      title = paste0(input$year)
      
      png(file=filename, width=640, height=480)
      p = state_choropleth(df_president_ts, title=year)
      print(p)
      dev.off()
      
      list(src         = filename,
           contentType = 'image/png',
           width       = 640,
           height      = 480,
           alt         = filename)
    }
  
  }, delete=FALSE)

})
