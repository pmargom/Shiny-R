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
  #checkboxInput("myCheckbox",
  #              label = "Choice A",
  #              value = TRUE),
  #textOutput("myId"),
  #radioButtons(
  #  'myRB',
  #  'Elije un número',
  #  choices = list(
  #    'el numero 1' = 1,
  #    'el numero 2' = 2,
  #    'el numero 3' = 3
  #  )
  #)
  #textInput("nameValue", label = h("Text input"), value = "Enter text..."),
  # textInput('nameValue', 
  #           label = 'Tu nombre', 
  #           value = ''),
  # textOutput('nameTyped'),
  # uiOutput('control'),
  # uiOutput('message'),
  # uiOutput('kk'),
  # uiOutput('messageClass'),
  # textInput('estilo', 
  #           label = 'Indica un estilo', 
  #           value = 'text-uppercase'),
  # uiOutput('textoConEstilo'),
  # 
  # textInput('estilo2', 
  #           label = 'Escribe un texto', 
  #           value = 'Escribo y estilo como quiero'),
  # uiOutput('textoConEstilo2'),
  # span('otro texto')
  
  radioButtons(
   'rbImages',
   'Elije una foto',
   choices = list(
     'El Teide' = 'teide.jpg',
     'La Orotava' = 'orotava.jpg',
     'Buenavista' = 'buenavista.jpg'
   )
  ),
  textOutput('txtImagenSeleccionada'),
  uiOutput('imagenSeleccionada'),
  uiOutput('btnDescargar')  
)

server <- function(input, output) {
  
  output$txtImagenSeleccionada <- renderText(
    paste('Veo que quieres descargar la imagen: ', input$rbImages)
  )
  
  output$imagenSeleccionada <- renderUI(
    div(
      p(),
      img(id='imagenSeleccionadaasas', src=paste0('./images/', input$rbImages), class='img-thumbnail'),
      p()
    )
  )
  
  output$btnDescargar <- renderUI(
    a(id='idDescargar',
      'Descarga la imagen',
      span(class='glyphicon glyphicon-envelope'),
      href=paste0('./images/', input$rbImages),
      download=input$rbImages,
      class='btn btn-primary'
    )
  )
  
  # output$nameValue <- renderPrint({ input$nameValue })
  # output$nameTyped <- renderText(
  #   paste('Hola, ', input$nameValue)
  # )
  # output$control <- renderUI (
  #   radioButtons(
  #     'myRB',
  #     'Elije un color',
  #     choices = list(
  #       'Rojo' = '#ff1a1a',
  #       'Verde' = '#00cc44',
  #       'Azul' = '#3399ff'
  #     )
  #   )
  # )
  # output$kk <- renderUI (
  #   radioButtons(
  #     'myRBClass',
  #     'Elije un color',
  #     choices = list(
  #       'Rojo' = 'text-danger',
  #       'Verde' = 'text-sucess',
  #       'Azul' = 'text-primary'
  #     )
  #   )
  # )
  
  # output$message <- renderUI(
  #   span('Soy del color seleccionado ',
  #        style=paste('color:', input$myRB))
  # )
  # 
  # output$controlClass <- renderUI(
  #   span('Soy del color seleccionado ',
  #        class= input$myRBClass)
  # )
  # 
  # output$messageClass <- renderUI(
  #   span('Soy del color seleccionado ',
  #        class=input$myRBClass)
  # )
  
  #output$myCheckbox <- renderText(
  #  input$myCheckbox
  #)
  #output$myRB <- renderText(
  #  input$myRB
  #)
  
  # output$estilo <- renderPrint({ input$estilo })
  # output$textoConEstilo <- renderUI(
  #   span('Cualwuier cosa', 
  #        class=input$estilo)
  # )
  # 
  # output$estilo2 <- renderPrint({ input$estilo2 })
  # output$textoConEstilo2 <- renderUI(
  #   span(input$estilo2, 
  #        class=input$estilo)
  # )
  
}

#kaskjas
shinyApp(ui, server)