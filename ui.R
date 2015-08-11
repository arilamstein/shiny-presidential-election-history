library(shiny)
library(choroplethr)

data("df_president_ts")
years = colnames(df_president_ts)[2:ncol(df_president_ts)]
years = as.numeric(years)

shinyUI(fluidPage(

  titlePanel("US Presidential Election Results: 1789-2012"),
  div(HTML("By <a href='http://www.arilamstein.com'>Ari Lamstein</a>. Blog post <a href='http://www.arilamstein.com/blog/2015/08/13/mapping-historic-us-presidential-election-results/'>here</a>. Source code <a href='https://github.com/arilamstein/shiny-presidential-election-history'>here</a>.")),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("year",
                  "Year:",
                  choices=years)
    ),

    mainPanel(
      imageOutput("map", width="640px", height="480px"),
      div(HTML("Legend:<br><ul><li>R = Republican
               <li>D = Democratic
               <li>DR = Democratic-Republican
               <li>W = Whig
               <li>F = Federalist
               <li>GW = George Washington
               <li>NR = National Republican
               <li>SD = Southern Democrat
               <li>PR = Progressive
               <li>AI = American Independent
               <li>SR = States' Rights
               <li>PO = Populist
               <li>CU = Constitutional Union
               <li>I = Independent
               <li>ND = Northern Democrat
               <li>KN = Know Nothing
               <li>AM = Anti-Masonic
               <li>N = Nullifier
               <li>SP = Split evenly</ul>"))
      
    )
  )
))
