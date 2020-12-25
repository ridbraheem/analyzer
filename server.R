function(input, output, session){
  
  filedata <- reactive({
    req(input$file1)
    df <- read.csv(input$file1$datapath, 
                   header = input$header, 
                   sep = input$sep)
    
  })

  output$updata <- renderDT({
    df <- filedata()
    return(datatable
           (df, 
             class="text-center cell-border stripe", 
             options = list(scrollX = TRUE)
             )
           )

  })
  
  output$Pselect <- renderUI({
    df <- filedata()
    selectInput(inputId = "p_select",
                label = "Legend:" , 
                choices = names(df)
                )
  })
  
  output$Pvalue <- renderUI({
    df <- filedata()
    selectInput(inputId = "p_value",
                label = "Value:" ,  
                choices = names(df)
                )
  })
  
  output$BarPlot <- renderPlot({
    
    df <- filedata()
    plot <- ggplot(df)
    plot <- plot + geom_col(aes_string(x = input$p_select, y = input$p_value), fill = "blue")
    plot <- plot + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
                         panel.background = element_blank(), axis.line = element_blank())
    plot
    
  })
  
  
  output$Lselect <- renderUI({
    df <- filedata()
    selectInput(inputId = "l_select",
                label = "X-axis:" ,  
                choices = names(df)
                )
  })
  
  output$Lvalue <- renderUI({
    df <- filedata()
    selectInput(inputId = "l_value",
                label = "Y-axis:" ,  
                choices = names(df)
                )
  })
  
  output$Linechart <- renderPlot({
    df <- filedata()
    plot <- ggplot(df, aes_string(x=input$l_select,y=input$l_value, group = 1)) + geom_point()
    plot <- plot + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
                         panel.background = element_blank(), axis.line = element_blank())
    plot
  })
  
  output$Hselect <- renderUI({
    df <- filedata()
    selectInput(inputId = "h_select",
                label = "Legend:" ,  
                choices = names(df)
                )
  })
  
  output$Hvalue <- renderUI({
    df <- filedata()
    selectInput(inputId = "h_value",
                label = "Value:" ,  
                choices = names(df)
                )
  })
  
  output$Hchart <- renderPlot({
    df <- filedata()
    plot <- ggplot(df)
    plot <- plot + geom_col(aes_string(x = input$h_select, y = input$h_value), fill = "red")
    plot <- plot + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
                         panel.background = element_blank(), axis.line = element_blank())
    plot <- plot + coord_flip()
    plot
  })
  
  output$Piselect <- renderUI({
    df <- filedata()
    selectInput(inputId = "pi_select",
                label = "Legend:" ,  
                choices = names(df)
                )
  })
  
  output$Pivalue <- renderUI({
    df <- filedata()
    selectInput(inputId = "pi_value",
                label = "Value:" ,  
                choices = names(df)
                )
  })
  
  output$Pichart <- renderPlot({
    df <- filedata()
    plot <- ggplot(df, aes(x="",y=input$pi_value, fill = input$pi_select)) + geom_bar(width = 1, stat = "identity")
    plot <- plot + coord_polar("y", start=0)
    plot <- plot + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
                         panel.background = element_blank(), axis.line = element_blank())
    plot
    
  })
  
}