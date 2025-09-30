library(shiny)

ui <- fluidPage(
  titlePanel("Let's Do Arithmetic!"),
  sidebarLayout(
    sidebarPanel(
      numericInput(inputId = "number1",
                   label = "Number 1",
                   value = 0),
      numericInput(inputId = "number2",
                   label = "Number 2",
                   value = 0),
      actionButton("addBtn", "Add"),
      actionButton("multBtn", "Multiply")
    ),
    mainPanel(
      h2("The result of the operation is:"),
      textOutput("result")
    )
  )
)

server <- function(input, output, session) {
  # Store the result reactively
  result <- reactiveVal(NULL)
  
  observeEvent(input$addBtn, {
    x1 <- as.numeric(input$number1)
    x2 <- as.numeric(input$number2)
    result(x1 + x2)
  })
  
  observeEvent(input$multBtn, {
    x1 <- as.numeric(input$number1)
    x2 <- as.numeric(input$number2)
    result(x1 * x2)
  })
  
  output$result <- renderText({
    req(result())  
    result()
  })
}

shinyApp(ui = ui, server = server)
