library(shiny)
library(magick)

ui <- fluidPage(
  
  titlePanel("R-eindeer"),
  
  sidebarLayout(
    sidebarPanel(
      radioButtons("coat_colour","coat colour", 
                   choiceNames = c("1", "2", "3", "4", "5", "6", "7", "8"), 
                   choiceValues = c("grey", "dark_grey", "black", "brown", "sorrel", "gold", 
                                    "cream", "pink"), 
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
                   inline = TRUE),
      
      radioButtons("blanket","blanket", 
                   choiceNames = c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10",
                                                   "11", "12", "13"), 
                   choiceValues = c("none", "red", "orange", "yellow", "green", "R_blue", 
                                    "R_blue_R", "dark_blue", "purple", "pink", "black", "grey", 
                                    "grey_R"), 
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
    
    # only show blanket outline when a blanket is selected (i.e. load blank layer when blanket
    # input is "none")
    blanket_status <- ifelse(input$blanket == "none", "none", "blanket")
    
    # load the images
    coat <- get_image("coat", paste0("reindeer_", input$coat_colour))
    highlights <- get_image("highlights", paste0("highlights_", input$highlights))
    hooves <- get_image("details", paste0("hooves_", input$hooves))
    eye_colour <- get_image("details", paste0("eye_", input$eye_colour))
    eye_background <- get_image("details", "eye_and_nostril")
    outline <- get_image("outlines", "outline_reindeer")
    blanket <- get_image("blanket", paste0("blanket_", input$blanket))
    outline_blanket <- get_image("outlines", paste0("outline_", blanket_status))
    
    # make the reindeer: overlay in order
    reindeer <- c(coat, highlights, hooves, eye_colour, eye_background, outline, blanket,
                  outline_blanket)
    
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
