dashboardPage(skin = "purple",
  dashboardHeader(title = "A N A L Y Z E R",
                  dropdownMenu(type = "messages"),
                  dropdownMenu(type = "notifications"),
                  dropdownMenu(type = "tasks")
                  ),
  dashboardSidebar(disable = TRUE),
  dashboardBody(
    div(style ="padding: 0% 25%;
                text-align: center; 
                margin: 23% 0%;",
             h1(style = "font-weight: 600; 
                text-transform: uppercase; 
                letter-spacing: 10px; 
                font-size: 2rem; 
                margin-bottom: 5rem;", 
                "Analyzer"),
             h4(style = "margin-bottom: 5%;", 
                "A dashboard builder that lets you build and customize your own dashboard fast and easy."),
             h5("Scroll down to try it out!"),
             a(class="btn btn-primary",
               href="https://github.com/ridbraheem/analyzer",
               role="button",
               "How It Works")
        ),
    fluidRow(
      box(width = 12, 
          collapsible = TRUE, 
          title = 'Load & Transform', 
          solidHeader = TRUE, 
          status = 'primary',
        column(width = 4, 
               fileInput("file1", 
                         "Upload a csv file", 
                         multiple = FALSE, 
                         accept = c(".csv")
                         )
               ),
        column(width = 4, 
               textInput("sep", 
                         label = "Enter the Separator Character:", 
                         value = ",")
               ),
        column(width = 4, 
               checkboxInput("header", 
                             label = "Use first row as header", 
                             value = TRUE)
              )
            )
          ),
      box(width = 14, 
          collapsible = TRUE, 
          title = 'Data', 
          solidHeader = TRUE, 
          status = 'primary', 
          DTOutput(outputId = "updata")
          ),
      box(width = 14, 
          collapsible = TRUE, 
          title = 'Dashboard', 
          solidHeader = TRUE, 
          status = 'primary',
       fluidRow(
         box(collapsible = TRUE,
             title = 'Bar Chart', 
             status = 'primary',
        fluidRow(
         column(width = 4,
                uiOutput("Pselect")
                ),
         column(width = 4, 
                uiOutput("Pvalue")
                )
              ), 
            plotOutput("BarPlot")
            ),
        box(collapsible = TRUE,
            title = 'Scatterplot', 
            status = 'primary',
          fluidRow(
            column(width = 4, 
                uiOutput("Lselect")
                ),
            column(width = 4,
                uiOutput("Lvalue")
                )
            ), 
            plotOutput("Linechart")
            )
          ),
       fluidRow(
          box(collapsible = TRUE,
              title = 'Horizontal Chart', 
              status = 'primary',
             fluidRow(
               column(width = 4,
                      uiOutput("Hselect")
                      ),
               column(width = 4, 
                      uiOutput("Hvalue")
                      )
             ), 
             plotOutput("Hchart")
             ),
       box(collapsible = TRUE,
           title = 'Pie Chart', 
           status = 'primary',
             fluidRow(
               column(width = 4, 
                      uiOutput("Piselect")
                      ),
               column(width = 4,
                      uiOutput("Pivalue")
                      )
             ), 
              plotOutput("Pichart"))
            )
        ),
    
 div(
   class= "container text-center",
     div(style= "margin-bottom: 1rem; 
                 font-size: 1.5rem;",
         a("Linkedin", 
           href="http://linkedin.com/in/ridwanullah-i-170b98b2", 
           style= "margin:0 .5rem;"),
         a("GitHub", 
           href="https://github.com/ridbraheem",
           style= "margin:0 .5rem;"),
         a("Mail", 
           href="mailto:ridwanibraheem1@gmail.com",
           style= "margin:0 .5rem;")
        )
    ) 

  )
)








