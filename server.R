options(shiny.maxRequestSize=1000000*1024^2)

server <- function(input, output,session) {
  dataInput<-reactive({
    inFile <- input$file1
    
    if (is.null(inFile))
      return(NULL)
    if(input$csv=="csv"){
      data<-read.csv(inFile$datapath, header = input$header)
    }else {
      "data<-read_excel(inFile$datapath,col_names= input$header)"
    }
    
    colnames(data)[1]<-"Row.Labels"
    # organize 
    data<-data%>%
      gather(key="SKUs",value = "Value",-Row.Labels)%>%
      filter(Value==1)%>%
      select(-Value)
    
    # Convert to sparse matrix
    as.data.frame(data)
  })
  
  
  
  observeEvent(input$extract,{
    data<-dataInput()
    datam<<-as(split(data[,"SKUs"],data[,"Row.Labels"]),"transactions")
    
    rules<<-apriori(datam,parameter =list(support=as.numeric(input$support), #Set minimum support
                                          confidence=as.numeric(input$confidence),maxlen=as.numeric(input$Maxlen),minlen=as.numeric(input$Minlen)))
    
    # Rules---------------------------------------------------------------------------------------------------------------------- 
    
    nrowq<<-nrow(quality(rules))
    
   # if(nrowq==0){
   #   rul1<-NULL
   # } else{
      rul1<<-DATAFRAME(rules)
   # }
    
    
    output$print<-renderPrint({"0 posible rules,either Min support or Min confidence is too high"})
    
    output$contents <- renderDataTable({
      if (input$remov==TRUE){
        rul<<-rul1%>%filter(count!=0)%>%
          mutate_if(is.numeric,round,digits=2)
        datatable(rul)
      } else{
        rul<<-rul1%>%
          mutate_if(is.numeric,round,digits=2)
        datatable(rul)
      }
    })
    
    output$downloadData <- downloadHandler(
      filename = function() {
        paste("rules-", Sys.Date(), ".csv", sep="")
      },
      content = function(file) {
        write.csv(rul, file)
      }
    )
  }) 
  #graphs---------------------------------------------------------------------------------------------------
  
  observeEvent(input$Go1,{
    output$baseplot<-renderPlot({
      #scatter
      if(input$GraphType == "scatterplot")
      {
      plot(rules, method="scatterplot", measure=input$measure,shading =input$shading)
      }
      # matrix
      else if(input$GraphType =="matrix"){
        if(input$GraphType =="3d"){
      plot(rules, method="matrix",measure=input$measure1,engine="3d") 
        }
      plot(rules, method="matrix",measure=input$measure1,shading =input$shading1,engine=input$engine)
      }
      
      # 2key
      else if(input$GraphType =="two-key plot"){
      plot(rules, method="two-key plot")
      }
      # mosaic
      else if(input$GraphType =="mosaic"){
      plot(subset(rules)[as.numeric(input$rule1)], method="mosaic",data=datam) 
      }
      # double decker
      else if(input$GraphType =="doubledecker"){
        plot(subset(rules)[as.numeric(input$rule)], method="doubledecker",data=datam)
      } 
      # parallel 
      else if(input$GraphType =="paracoord"){
      plot(rules, method="paracoord")
      } 
      # graph
      else if(input$GraphType =="graph"){
      plot(rules, method="graph",shading=input$shading2,measure =input$measure2)
      }
      # grouped
      else if(input$GraphType =="grouped"){
      plot(rules, method="grouped",shading=input$shading3,measure =input$measure3,control=list(rhs_max=as.numeric(input$max)))
      }
      # Iplots
      else {
      plot(rules, method="iplots",engine=input$engine1)
      }
    })
    
    output$downloadgraph <- downloadHandler(
      filename = function() {
      paste(input$GraphType, Sys.Date(), ".png", sep="")
      },
      content = function(file) {
        png(file)
        if(input$GraphType == "scatterplot")
        {
          plot(rules, method="scatterplot", measure=input$measure,shading =input$shading)
        }
        # matrix
        else if(input$GraphType =="matrix"){
          if(input$GraphType =="3d"){
            plot(rules, method="matrix",measure=input$measure1,engine="3d") 
          }
          plot(rules, method="matrix",measure=input$measure1,shading =input$shading1,engine=input$engine)
        }
        
        # 2key
        else if(input$GraphType =="two-key plot"){
          plot(rules, method="two-key plot")
        }
        # mosaic
        else if(input$GraphType =="mosaic"){
          plot(subset(rules)[as.numeric(input$rule1)], method="mosaic",data=datam) 
        }
        # double decker
        else if(input$GraphType =="doubledecker"){
          plot(subset(rules)[as.numeric(input$rule)], method="doubledecker",data=datam)
        } 
        # parallel 
        else if(input$GraphType =="paracoord"){
          plot(rules, method="paracoord")
        } 
        # graph
        else if(input$GraphType =="graph"){
          plot(rules, method="graph",shading=input$shading2,measure =input$measure2)
        }
        # grouped
        else if(input$GraphType =="grouped"){
          plot(rules, method="grouped",shading=input$shading3,measure =input$measure3,control=list(rhs_max=as.numeric(input$max)))
        }
        # Iplots
        else {
          plot(rules, method="iplots",engine=input$engine1)
        }
    dev.off()
      }
    )
    
  })
  # interactive graphs-----------------------------------------------------------------------------------------  
  
  observeEvent(input$Go2,{
    output$plot<-renderVisNetwork({
      plot(rules, method="graph",shading=input$shading22,measure =input$measure22,engine=input$engine14)
    })
    output$plotly<-renderPlotly({
      #scatter
      if(input$GraphType1 == "scatterplot"){
        if(input$engine11 =="htmlwidget"|input$engine11=="plotly"){
          plot(rules, method="scatterplot", measure=input$measure11,shading =input$shading11,engine=input$engine11)
        }else{
          plot(rules, method="scatterplot", measure=input$measure11,shading =input$shading11,engine=input$engine11)
        }
      }
      
      # matrix
      else if(input$GraphType1 =="matrix"){
        if(input$engine12 =="htmlwidget"|input$engine12 =="plotly"){
          plot(rules, method="matrix",measure=input$measure1,engine=input$engine12) 
        }
        plot(rules, method="matrix",measure=input$measure12,shading =input$shading12,engine=input$engine12)
      }
      
      # 2key
      else if(input$GraphType1 =="two-key plot"){
        if(input$engine13 =="htmlwidget"|input$engine13 =="plotly"){
          plot(rules, method="two-key plot",engine=input$engine13)
        }else{
          plot(rules, method="two-key plot",engine=input$engine13) 
        }
      }
      # Iplots
      else {
        NULL
      }
      
    })
  })  
  session$onSessionEnded(function() {
  print("app closing")
    stopApp()
  })
}