library(shiny)

ui <- fluidPage(
  
  titlePanel("R-eindeer"),
  
  sidebarLayout(
    sidebarPanel(
      radioButtons("check1","coat colour", choices = c("grey","brown"))
      ),
    
    mainPanel(
      imageOutput("reindeer_coat"),
      imageOutput("reindeer_outline")
      )
    )
  )


server <- function(input,output){
  
  getImage <- reactive({
    list(src = paste0("./coat/reindeer_", input$check1, ".png"),
         width = 500,
         height = 500)
  })
  
  output$reindeer_coat <- renderImage({
    getImage()
  }, deleteFile = FALSE)
  
  output$reindeer_outline <- renderImage({
    return(list(src = "./outlines/reindeer_outline.png",
                width = 500,
                height = 500,
                contentType = 'image/png'))
  }, deleteFile = FALSE)
}

shinyApp(ui = ui, server = server)