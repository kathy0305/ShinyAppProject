

library(shiny)
library(leaflet)
#source("SpringsVisitors.csv")

##read the file
Springs <- read.csv("SpringsVisitors1.csv",header=TRUE)
##inlcude a function that converst Data frames to matrix
## just trying to make it easier on the Shiny server
matrix.please <<-function(x) {
    m<-as.matrix(x[,-1])    #don't include the first column
    rownames(m)<-x[,1]
    m
}
#M <- new.env()
M <<- matrix.please(Springs)

## adding coordinates for springs 
SpringsLatLong <- data.frame(lat= c(29.951359,29.590194,29.497500),
                             lng= c(-82.775863,-82.933074,-82.975794))
## add atributes to map
YesMap<- SpringsLatLong %>%
    leaflet()%>%
    setView(lng=-82.770996,lat=29.527582, zoom = 8)%>%
    addTiles()%>%
    addMarkers(label= c("Icehtucknee Springs","Fanning Springs","Manatee Springs"))

# Define server logic required to draw a histogram and display map and tabs

# Define a server for the Shiny app
function(input, output){
    
    # Fill in the spot we created for a plot
    output$SpringsPlot <- renderPlot({
        
        barplot(height = M[,input$region],
        # Render a barplot
       
                col="lightgreen",
                #ylim = c(1000,600000),
                ylim=c(0,5+max(M[,input$region])),
                main=input$region,
                las=2,
                sub=" Attendance per Year",
                font.sub = 2, col.sub = "Darkgreen", cex.sub = 1.5)})
    
   
        ## if user picked to see location of springs, the map will be included
        output$FLMap<-renderLeaflet({
            Map <- switch(input$Map, 
                          yes = YesMap)
                          
            })
        ## Generate a summary of the data
        output$summary <- renderPrint({
            summary(M)
        })
    
    # Generate an HTML table view of the data
    output$table <- renderTable({
        data.frame(M)
    })
    
    
    
    ## Generate an App Instruction tab
    output$readme <- renderText({
        readLines("readme.html")
    })
}   

  

    
    
