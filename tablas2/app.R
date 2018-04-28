
library(shiny)

ui <- fluidPage(
  
  # selectInput("listaValores",
  #             label = h3("Elije un valor"), 
  #             choices = c()),

  selectizeInput("listaValores",
              label = h3("Elije un valor"), 
              choices = c()),
  
  tableOutput('table.accidentes')
  
  
)

server <- function(input, output, session) {
  data <- read.csv(
    file='bicicletas.csv',
    header=TRUE,
    fileEncoding = 'latin1',
    sep=';'
  )
  
  observe({
    #updateSelectInput(session, 'listaValores', choices = sort(data$DISTRITO)) 
    updateSelectizeInput(session, 'listaValores', choices = sort(data$DISTRITO)) #ddl editable
  })
  
  output$table.accidentes <- renderTable(
    data[data$DISTRITO == input$listaValores, ]
  )
  
  
}

shinyApp(ui, server)