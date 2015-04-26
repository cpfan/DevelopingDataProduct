
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

filterData <- function(mpg,stdd) {
        filteredObservations <- mtcars[mtcars[1] >= (mpg-stdd) & mtcars[1] <= (mpg+stdd),]
        if(nrow(filteredObservations) > 0)
                return(filteredObservations)
        filterData(mpg,stdd+0.5)
}

predictCylinder <- function(mpg) {
        
        # Filter observation between +0.5 to -0.5 of the input variable 'mpg'.
        # If no record is found, the method will increase the range by +/- 0.5
        # and try again till at least 1 record is found
        filteredObservations <- filterData(mpg,0.5)
        
        # If all records indicates the same number of cylinders, then the method
        # will return the number of cylinder.
        if(nrow(filteredObservations) == 1 | 
           length(unique(filteredObservations[,2])) == 1)
                return(paste(mean(filteredObservations[,2]), collapse = " or "))
                       
       # Else, the method check if there is returned records, if yes, show the
       # possible value
       return(paste(unique(filteredObservations[,2]),collapse=" or"))
}

shinyServer(function(input, output) {
        
        output$inputValue <- renderPrint({input$mpg})
        
        output$prediction <- renderPrint({predictCylinder(input$mpg)})


})
