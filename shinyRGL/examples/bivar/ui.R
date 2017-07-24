library(shiny)
library(shinyRGL)

#' Define UI for application that replicated the 'bivar' rgl example
#' @author Jeff Allen \email{jeff@@trestletech.com}
ui <- pageWithSidebar(
  
  # Application title
  headerPanel("Shiny bivar WebGL!"),
  
  # Sidebar with a slider input for number of points
  sidebarPanel(
    sliderInput("pts", 
                "Number of points:", 
                min = 25, 
                max = 1000, 
                value = 100)
    #helpText(HTML("Created using <a href = 'http://github.com/trestletech/shinyRGL'>shinyRGL</a>. <p>Example based on 'bivar' example by Daniel Adler.</p>"))
  ),
  
  # Show the generated 3d bivar plot
  mainPanel(
    webGLOutput("bivar")
  )
)
