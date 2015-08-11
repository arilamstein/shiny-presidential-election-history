# generate static images of the "none-mercator" maps of all the countries

library(choroplethr)
library(choroplethrMaps)

data(df_president_ts)
years = colnames(df_president_ts)[2:ncol(df_president_ts)]

for (year in years)
{
  filename = paste0("year", "-", year, ".png")
  
  print(paste("Making", filename))
  
  data(df_president_ts)
  df_president_ts$value = df_president_ts[, year]

  print(paste('printing', filename))
  png(file=filename, width=640, height=480)
  p = state_choropleth(df_president_ts, title=year)
  print(p)
  dev.off()
}