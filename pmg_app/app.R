library(shiny)
library(markdown)

ui <- fluidPage(
  #includeMarkdown('fichero.md')
  #tags$head(
  #  tags$link(rel = "stylesheet", type = "text/css", href = "./css/styles.css")
  #)  
  #tags$div(
  #  tags$p('es un párrafo'),
    #tags$img(src='./images/coche.jpg', alt='mi coche', style='border: solid 1px green')
  #)
  checkboxInput("myCheckbox",
                label = "Choice A",
                value = TRUE),
  textOutput("myId"),
  radioButtons(
    'myRB',
    'Elije un número',
    choices = list(
      'el numero 1' = 1,
      'el numero 2' = 2,
      'el numero 3' = 3
    )
  )

)

server <- function(input, output) {
  output$myId <- renderText(
    'hola caracola'
  )
  output$myCheckbox <- renderText(
    input$myCheckbox
  )
  output$myRB <- renderText(
    input$myRB
  )
}

#kaskjas
shinyApp(ui, server)