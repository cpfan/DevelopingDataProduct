
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("How many Cylinders is your ride?"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput('mpg',
                  'MPG',
                  min = 10,
                  max = 34,
                  value = 0.5)
    ),

    # Show a plot of the generated distribution
    mainPanel(
            p('Using the data from the mtcars dataset, this application will attempt to predict the number of cylinders your car has'),
            p('Use the slider to indicate the MPG of your ride!'),
            h3('Results of prediction'),
            h4('Your ride MPG is'), 
            verbatimTextOutput("inputValue"), 
            h4('Number of Cylinders'), 
            verbatimTextOutput("prediction")
    )
  )
))
