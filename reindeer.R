library(shiny)
library(magick)

ui <- fluidPage(
  
  titlePanel("R-eindeer"),
  
  sidebarLayout(
    sidebarPanel(
      radioButtons("check1","coat colour", choices = c("grey","brown"))
      ),
    
    mainPanel(
      imageOutput("reindeer")
      )
    )
  )

server <- function(input,output){
  
  get_image <- function(type, color) {
    image_read(file.path(type, paste0(color, ".png")))
  }
  
  output$reindeer <- renderImage({
    
    # load the images
    coat <- get_image("coat", paste0("reindeer_", input$check1))
    outline <- get_image("outlines", "reindeer_outline")
    
    # make the reindeer: overlay in order
    reindeer <- c(coat, outline)
    
    # create a temp file
    tmpfile <- reindeer %>%
      image_mosaic() %>%
      image_flatten() %>%
      image_write(tempfile(fileext='jpg'), format = 'jpg')
    
    # render the file
    return(list(src = tmpfile,
                height = 500,
                width = 500,
                alt = "Your reindeer",
                contentType = "image/jpg"))
  }, deleteFile = TRUE)
}

shinyApp(ui = ui, server = server)
