library(shiny)

shinyServer(function(input, output) {
   
    
  model<-reactive({
      dat<-brushedPoints(mtcars,input$brush1,xvar="wt",yvar="mpg")
      if(nrow(dat)<2){
          return(NULL)
      }
      lm(mpg~wt,data=dat)
  })
  output$slopeOut<-renderText({
      if(is.null(model)){
          "No Points selected"
      } else{
          model()[[1]][2]
      }
  })
  output$inOut<-renderText({
      if(is.null(model)){
          "No Points selected"
      } else{
          model()[[1]][1]
      }
  })
  output$plot1<-renderPlot({
      plot(mtcars$wt,mtcars$mpg,xlab="Weight",ylab="Miles Per Gallon",
           main="Weigth and Miles Per Gallon relation")
      if(!is.null(model())){
          abline(model(),col="red",lwd=1)
      }
  })
  output$plot2<-renderPlot({
      datx<-rnorm(5000,mean=input$sliderMean,sd=input$sliderSD)
      hist(datx,main="Simulation")
  })
  
})
