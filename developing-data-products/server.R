## Load shiny library
library(shiny)
## Standard shinyserver function to caculate the outputs to be displayed
shinyServer(
  function(input, output) {
    ## Render the input
    output$text_input_distance <- renderText({
      input_distance()
    })
    ## To find the input units from radio button values
    input_distance <- reactive({
      if(input$type == 1)
        input_distance <- paste(input$slider_distance, "kilometers")
      else
        input_distance <- paste(input$slider_distance, "miles")
    })
    ## Calculate and render output
    converted <- reactive({
      if(input$type == 1)
        converted <- paste(convertkilometers(input$slider_distance), "miles")
      else
        converted <- paste(convertmiles(input$slider_distance), "kilometers")
    })
    output$text_output_distance <- renderText({
      converted()
    })
    ## Function to convert miles to kilometers
    convertmiles <- function(m)
    {
      m*1.609
    }
    ## Function to convert Fahrenheit to Celsius
    convertkilometers <- function(k)
    {
      k*0.621
    }
  }
)
