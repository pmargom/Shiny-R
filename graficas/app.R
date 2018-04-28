
library(shiny)

ui <- fluidPage(
  
  # selectInput("listaValores",
  #             label = h3("Elije un valor"), 
  #             choices = c())
  
  #plotOutput('histograma'),
  
  tabsetPanel(
    tabPanel(
      'Nombre',
      htmlTemplate(
        'vista.html',
        nombre = 'pedro'
      )
    ),
    tabPanel(
      'Formulario',
      fluidRow(
        column(
          4,
          selectizeInput("listaValores",
                         label = h3("Elije un valor"), 
                         choices = c()
                         )
          ),
        column(
          4,
          selectInput("tipo.accidente",
                      label = h3("Elije un valor"),
                      choices = c()
                      )
        ),
        column(
          4,
          dateRangeInput("fechas",
                         label = h3("Rango de fechas"),
                         start = '01/01/2018',
                         format = 'dd/mm/yyyy',
                         language = 'es'
          )
        )
      )
    ),
    tabPanel(
      'Datos',
      tableOutput('table.accidentes')
    )
  )

)

server <- function(input, output, session) {
  data <- read.csv(
    file='bicicletas.csv',
    header=TRUE,
    fileEncoding = 'latin1',
    sep=';'
  )
  
  data$Fecha <- as.Date(data$Fecha, '%d/%m/%Y') #convierto al fecha en string a fecha de verdad
  data$Lugar <- trimws(data$Lugar)
  data$FechaOK <- format(data$Fecha, '%d/%m/%y')
  
  observe({
    #updateSelectInput(session, 'listaValores', choices = sort(data$DISTRITO)) 
    updateSelectizeInput(session, 'listaValores', choices = sort(data$DISTRITO)) #ddl editable
  })
  
  observe({
    updateSelectInput(session, 'tipo.accidente', choices = sort(data[data$DISTRITO == input$listaValores, ]$Tipo.Accidente))
  })
  
  # output$histograma <- renderPlot({
  #   hist(data$Nm.Tot.Victimas)
  # })
  
  output$table.accidentes <- renderTable(
    data[data$DISTRITO == input$listaValores & data$Tipo.Accidente == input$tipo.accidente & data$Fecha >= input$fechas[1] & data$Fecha <= input$fechas[2], ]
  )
  
  
}

shinyApp(ui, server)