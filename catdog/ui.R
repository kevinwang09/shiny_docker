shinyUI(
    fluidPage(
        
        titlePanel("Cats and dogs"),
        
        sidebarLayout(
            sidebarPanel(
                textInput(inputId = "url", 
                          label = "Enter URL")
            ),
            mainPanel(
                dataTableOutput(outputId = "pred_table")
            )
        )
    )
)
