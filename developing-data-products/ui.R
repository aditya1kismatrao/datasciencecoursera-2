## Load shiny library
library(shiny)
## Standard shinyUI for GUI display
shinyUI(pageWithSidebar(
  titlePanel("Metric/Imperial Distance Converter"),
  ## Sidebarpanel
  sidebarPanel(
    helpText(p(h5("Use this app to convert distance between miles and kilometers."))),
    br(),
    radioButtons("type", label = p(h5("Choose conversion type")),
                 choices = list("Convert kilometers to miles" = 1,
                                "Convert miles to kilometers" = 2),selected = 1),
    br(),
    sliderInput("slider_distance",
                label = p(h5("Choose the distance you want to convert")),
                min = 0, max = 500, value = 5)
  ),
  ## MainPanel
  mainPanel(
    tabsetPanel(
      tabPanel("Output",
               p(h5("Input:")),
               textOutput("text_input_units"),
               textOutput("text_input_distance"),
               br(),
               p(h5("Converts to:")),
               textOutput("text_output_distance"),
               textOutput("text_output_units")
      ),
      tabPanel("How to Use the App",
               p(h4(":")),
               br(),
               helpText("This app allows the user to convert between miles and kilometers, starting from either metric or non-metric units."),
               HTML("<u><b>Formula used for the conversion is: </b></u>
                    <br> <br>
                    <b> M = (K * 1.61) + 32 ; K = M*0.621 </b>
                    <br>
                    You can enter any integer values between 0 to 500 using the slider for both miles and kilometers <br>
                    <br>
                    Select a unit on the slider, and the input and the converted output will be displayed<br>
                    ")
               )
               )
               )
               ))
