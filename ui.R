
library(shiny)
library(leaflet)
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


fluidPage(
    
    
    titlePanel("Attendance for 3 major Florida Springs per Year"),
    
    # Generate a row with a sidebar
    sidebarLayout(      
        
        # Define the sidebar with one input
        sidebarPanel(
            helpText("Choose one of the Springs, on the drop box below,
                     to see bar chart of attendance per year. ",style = "color:darkgreen"),
            ## add drop box for user to pick a Spring
            selectInput("region", label = h3("Spring:"), 
                        choices=colnames(M)),
            hr(),
            ## add radio buttons for user to pick whether or not pick location map   
            radioButtons("Map", label = h3("Include Location of Springs ?"),
                             choices = list("Yes"= "yes" , "No"="no" ), 
                             selected = "yes"),
             
            hr(),
            ## add some help text to make the user aware that there are tabs
            helpText("For more information about this app please see tabs above plot"),
            br(),
            br(),
            br(),
            img(src = "springs.png", height = 250, width = 350)
        ),
        
        # Create a spot for the barplot and create tabs
        mainPanel(
            ## The main panel will have several tabs
            
            
            tabsetPanel(type = "tabs", 
                        tabPanel("Plot", plotOutput("SpringsPlot"),
                                 hr(),
                                 hr(),
                                       leafletOutput("FLMap", height=400)), 
                        tabPanel("Summary", verbatimTextOutput("summary")), 
                        tabPanel("Table", tableOutput("table")),
                        tabPanel("App Instruction",fluidPage(htmlOutput('readme')))
                        
                      
            )
        )
    )
)

