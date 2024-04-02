#### Pre-amble ####
# Clean data from : https://www.ushmm.org/online/hsv/source_view.php?SourceId=49478

#### Workspace set up ####
library(shiny)
library(dplyr)
library(ggplot2)
library(readr)
library(rsconnect)

# Load data
Auschwitz_Death_Certificates_1942_1943_Auschwitz <- read_csv("raw_data.csv")

# Process the data to count victims by category
victims_count <- Auschwitz_Death_Certificates_1942_1943_Auschwitz |>
  group_by(Religion) |>
  summarise(Count = n())

# Define UI for application
ui <- fluidPage(
  titlePanel("Holocaust Victims at Auschwitz"),
  sidebarLayout(
    sidebarPanel(
      selectizeInput("religion", "Select Religion:", choices = unique(victims_count$Religion), multiple = TRUE)
    ),
    mainPanel(
      plotOutput("plot"),
      dataTableOutput("table")
    )
  )
)

# Define server logic
server <- function(input, output) {
  # Filter data based on selected ethnicities
  filtered_data <- reactive({
    Auschwitz_Death_Certificates_1942_1943_Auschwitz |>
      filter(Religion %in% input$religion)
  })
  
  # Generate plot with filtered data
  output$plot <- renderPlot({
    ggplot(filtered_data(), aes(x = Religion, fill = Religion)) +
      geom_bar() +
      labs(title = "Number of Holocaust Victims by Religion", x = "Religion", y = "Count") +
      theme(axis.text.x = element_text(angle = 45, hjust = 1))
  })
  
  # Generate table with filtered data
  output$table <- renderDataTable({
    filtered_data()
  })
}


# Run application
shinyApp(ui = ui, server = server)
