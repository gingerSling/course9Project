library(shiny)

shinyUI(fluidPage(
  

  titlePanel("Course 9 Project"),
  

  sidebarLayout(
    sidebarPanel(
       h2("First Tab"),
       h3("Slope"),
       textOutput("slopeOut"),
       h3("Intercept"),
       textOutput("inOut"),
       h2("Second Tab"),
       sliderInput("sliderMean", "What is the mean to simulate?", min = -20, max = 20, value = 0),
       sliderInput("sliderSD", "What is the standard deviation to simulate?",min = 0, max = 10, value = 1)
    ),

    mainPanel(
       tabsetPanel(type = "tabs", 
                   tabPanel("Visualize Many Models",br(),plotOutput("plot1",brush=brushOpts(
                       id="brush1"
                   ))),
                   tabPanel("Normal Simulation", br(), plotOutput("plot2"))
       
    ),
    h5("This is just a small App that consists of 2 tabs. The first one fits a linear model with the data selected in the plot of the mtcars dataset, the slope and the intercept of the linear model fitted will be deployed on the side. The second one is just a histagram of random normal simulations in which the user can choose the mean and the standard deviation with the slider.")
  )
)))
