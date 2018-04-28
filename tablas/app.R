library(shiny)

#descargar datasets de -> http://datos.gob.es/es/catalogo/l01280148-bibliotecas-municipales-prestamos-20161

ui <- fluidPage(

  #pintamos una tabla
  #dataTableOutput('tabla.prestamosData')
  
  numericInput(
    inputId = 'umbralDesde',
    label='Indica un umbral',
    value=0
  ),
  numericInput(
    inputId = 'umbralHasta',
    label='Indica un umbral',
    value=30000
  ),
  
  tableOutput('tabla.prestamos')
  
)

server <- function(input, output) {
  
  output$tabla.prestamos <- renderTable({
    data <- read.csv(
      file='biblioteca.csv',
      header=TRUE,
      fileEncoding = 'latin1',
      sep=';'
    )
    #data
    data[data$NÚMERO >= input$umbralDesde & data$NÚMERO <= input$umbralHasta, ]
  })
  
  # output$tabla.prestamosData <- renderDataTable({
  #   read.csv(
  #     file='biblioteca.csv',
  #     header=TRUE,
  #     fileEncoding = 'latin1',
  #     sep=';')
  # })  
  
}

shinyApp(ui, server)