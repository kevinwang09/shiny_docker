shinyUI(
    fluidPage(
        
        titlePanel("Cats and dogs"),
        
        sidebarLayout(
            sidebarPanel(
                textInput(inputId = "url", 
                          label = "Enter URL"),
                h6("E.g. https://upload.wikimedia.org/wikipedia/commons/4/4c/Push_van_cat.jpg")
            ),
            mainPanel(
                dataTableOutput(outputId = "pred_table"),
                plotOutput(outputId = "image")
            )
        )
    )
)
