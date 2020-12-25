library(shiny)
library(shinydashboard)
library(DT)
library(readr)
library(dplyr)
library(ggplot2)
library(data.table)
library(plotly)
library(htmltools)
library(htmlwidgets)
library(RColorBrewer)
library(rsconnect)


ui <- source('server.R', local=TRUE)$value


server <- source('server.R', local=TRUE)$value


shinyApp(ui, server)
