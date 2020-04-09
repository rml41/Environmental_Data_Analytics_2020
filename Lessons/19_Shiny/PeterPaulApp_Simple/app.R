#### Load packages ----
library(shiny)
library(tidyverse)

#### Load data ----
nutrient_data <- read_csv("Data/NTL-LTER_Lake_Nutrients_PeterPaul_Processed.csv")
nutrient_data$sampledate <- as.Date(nutrient_data$sampledate, format = "%Y-%m-%d")
nutrient_data <- nutrient_data %>%
  filter(depth_id > 0) %>%
  select(lakename, sampledate:po4)

#### Define UI ----
### make ui fluidPage to specify that window of camp can be resized 
#### depending on size of computer screen/users's desires 
ui <- fluidPage(
  titlePanel("Nutrients in Peter Lake and Paul Lake"),
  sidebarLayout( ### specify layout with a sidebar 
    sidebarPanel( ### specify contents of the sidebar 
      
      # Select nutrient to plot
      ### brings dropdown menu for user to choose one option
      ### specify choices
      ### to change the names of the choices, change col names in the data source
      ### need to specify one to be selected right when it is opened up (could be any option from chioces)
      selectInput(inputId = "y", 
                  label = "Nutrient",
                  choices = c("tn_ug", "tp_ug", "nh34", "no23", "po4"), 
                  selected = "tp_ug"),
  
      ),

    # Output
    mainPanel( ###specify contents of the mainpanel 
      plotOutput("scatterplot")
    )))

#### Define server  ----
####### serve is where we feed in the data 
server <- function(input, output) {
     
    # Create a ggplot object for the type of plot you have defined in the UI  
       output$scatterplot <- renderPlot({ ### renderPlot says to re-render the plot any time we have any new activity 
        ggplot(nutrient_data, 
               aes_string(x = "sampledate", y = input$y, 
                          fill = "depth_id", shape = "lakename")) +
           ### specify aesthetic with aes_string 
           ### anything that is not interactive is coded as normal in ggplot function
           ### anything interactive is coded as an input, e.g. input$y - y was specified above as "inputID"
          geom_point(alpha = 0.8, size = 2) +
          theme_classic(base_size = 14) +
          scale_shape_manual(values = c(21, 24)) +
          labs(x = "Date", y = expression(Concentration ~ (mu*g / L)), shape = "Lake", fill = "Depth ID") +
          scale_fill_distiller(palette = "YlOrBr", guide = "colorbar", direction = 1)
          #scale_fill_viridis_c(option = "viridis", begin = 0, end = 0.8, direction = -1)
      })
       
       
  } ### ends code for data unput


#### Create the Shiny app object ----
shinyApp(ui = ui, server = server)


