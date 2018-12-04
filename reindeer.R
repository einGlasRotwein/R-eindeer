library(shiny)
library(magick)

ui <- fluidPage(
  
  titlePanel("R-eindeer"),
  
  sidebarLayout(
    sidebarPanel(
      radioButtons("coat_colour","coat colour", 
                   choiceNames = c("1", "2", "3", "4", "5", "6", "7"), 
                   choiceValues = c("grey", "dark_grey", "black", "brown", "sorrel", "gold", 
                                    "cream"), 
                   inline = TRUE),
      
      radioButtons("highlights","highlights", 
                   choiceNames = c("1", "2", "3", "4"), 
                   choiceValues = c("none", "dark", "light", "R_blue"), 
                   inline = TRUE),
      
      radioButtons("hooves","hooves", 
                   choiceNames = c("1", "2", "3"), 
                   choiceValues = c("dark", "light", "R_blue"), 
                   inline = TRUE),
      
      radioButtons("eye_colour","eye colour", 
                   choiceNames = c("1", "2", "3"), 
                   choiceValues = c("light_brown", "dark_brown", "blue"), 
                   inline = TRUE)
      ),
    
    mainPanel(
      imageOutput("reindeer")
      )
    )
  )

server <- function(input,output){
  
  get_image <- function(type, colour) {
    image_read(file.path(type, paste0(colour, ".png")))
  }
  
  output$reindeer <- renderImage({
    
    # load the images
    coat <- get_image("coat", paste0("reindeer_", input$coat_colour))
    highlights <- get_image("highlights", paste0("highlights_", input$highlights))
    hooves <- get_image("details", paste0("hooves_", input$hooves))
    eye_colour <- get_image("details", paste0("eye_", input$eye_colour))
    eye_background <- get_image("details", "eye_and_nostril")
    outline <- get_image("outlines", "reindeer_outline")
    
    # make the reindeer: overlay in order
    reindeer <- c(coat, highlights, hooves, eye_colour, eye_background, outline)
    
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
