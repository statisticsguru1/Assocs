marketbasketUI<-function(id) {
  ns <- NS(id)
  page_navbar(
    bg="#000",
    tags$head(tags$link(rel = "stylesheet", type = "text/css", href = "styles.css"),
              #tags$script(src = "www/pagination.js")
              ),
    theme = bslib::bs_theme(version = 5),
    title = "Association Rule Miner",
    nav_panel(title = "Rules",
              page_fillable(
                layout_sidebar(
                  sidebar = sidebar(
                    bg="#FAFAFA",
                    fg="black",
                    fluidRow(offset=1,
                             h4(tags$strong(("Data upload"))),
                             fileInput(ns("file1"), "Choose CSV File",
                                       accept = c(
                                         "text/csv",
                                         "text/comma-separated-values,text/plain",
                                         ".csv")
                             ),
                             checkboxInput(ns("header"), "Header", TRUE),
                             selectInput(ns("csv"), "file type",
                                         c("csv","excel"))
                    ),
                    fluidRow(offset=1,
                             h4(tags$strong(("Rules inputs"))),
                             column(6,
                                    # minimum support
                                    numericInput(inputId = ns("support"),label = "Min Support",value=0)),
                             column(6,
                                    # minimum Confidence
                                    numericInput(inputId = ns("confidence"),label = "Min confidence",value=0))),
                    fluidRow(offset=1,
                             column(6,
                                    # Min len
                                    numericInput(inputId = ns("Minlen"),label = "Min length",value=2)),
                             column(6,
                                    # max len
                                    numericInput(inputId = ns("Maxlen"),label = "max length",value=2))),
                    # Remove rules with count 0
                    checkboxInput(ns("remov"), "exclude zero counts", FALSE),
                    fluidRow(offset=1,
                             column(5,
                                    actionButton(ns("extract"),"mine Rules",class="button")),
                             column(7,
                                    # Button
                                    downloadButton(ns("downloadData"), "Download Rules",class="button"))),
                    width = 370),
                  h4(tags$strong(("Rules"))),
                  uiOutput(ns("contents"))
                )
              )
    ),
    nav_menu(title = "Graphing",
             nav_panel(title=tags$div(icon("chart-line"),"static graphs"),
                       page_fillable(
                         layout_sidebar(
                           sidebar = sidebar(
                             h4(tags$strong(("Static graphs Inputs"))),
                             fluidRow(offset=1,
                                      selectInput(ns("GraphType"),"Graph Type",
                                                  c(Scatterplot="scatterplot",`Two key plot`="two-key plot",
                                                    Matrix="matrix",Mosaic="mosaic",
                                                    Doubledecker="doubledecker",
                                                    Graph="graph",Paracoord="paracoord",
                                                    Grouped="grouped"),
                                                  width=345
                                      )),
                             
                             
                             # show this pannel when it is scatterplot
                             conditionalPanel(
                               condition = sprintf("input['%s'] =='scatterplot'",ns("GraphType")),
                               fluidRow(
                                 column(6,
                                        selectInput(ns("measure"),"measure",
                                                    c(lift="lift",confidence= "confidence",support="support"))),
                                 
                                 column(6,
                                        selectInput(ns("shading"),"shading",
                                                    c(support="support",confidence= "confidence",lift="lift",order="order"))))
                             ),
                             
                             # show this pannel when it is Matrix
                             conditionalPanel(
                               condition = sprintf("input['%s'] =='matrix'",ns("GraphType")),
                               fluidRow(
                                 column(6,
                                        # measure
                                        selectInput(ns("measure1"),"measure",
                                                    c(lift="lift",support="support",
                                                      confidence= "confidence"))),
                                 column(6,
                                        # shading
                                        selectInput(ns("shading1"),"shading",
                                                    c(support="support",
                                                      confidence= "confidence",
                                                      lift="lift",
                                                      order="order")))),
                               column(12,
                                      fluidRow(
                                        column(12,
                                               selectInput(ns("engine"),"engine",
                                                           c("3d","default")))))),
                             
                             # show this pannel when it is two-key plot 
                             conditionalPanel(
                               condition = sprintf("input['%s'] =='two-key plot'",ns("GraphType")),
                               fluidRow()
                             ),
                             
                             # show this pannel when it is doubledecker
                             conditionalPanel(
                               condition = sprintf("input['%s'] =='doubledecker'",ns("GraphType")),
                               textInput(ns("rule"),"Rule Number",value=1)
                             ),
                             
                             # show this pannel when it is mosaic
                             conditionalPanel(
                               condition = sprintf("input['%s'] =='mosaic'",ns("GraphType")),
                               numericInput(ns("rule1"),"Rule Number",value=1)),
                             # show this pannel when it is paracoord. 
                             conditionalPanel(
                               condition = sprintf("input['%s'] =='paracoord'",ns("GraphType")),
                               fluidRow()
                             ),
                             
                             # show this pannel when it is graph
                             conditionalPanel(
                               condition = sprintf("input['%s'] =='graph'",ns("GraphType")),
                               
                               fluidRow(
                                 column(6,
                                        # measure 
                                        selectInput(ns("measure2"),"measure",
                                                    c(lift="lift",
                                                      support="support",
                                                      confidence= "confidence"))),
                                 column(6,
                                        # shading
                                        selectInput("shading2","shading",
                                                    c(support="support",
                                                      confidence= "confidence",
                                                      lift="lift",
                                                      order="order"))))
                               
                             ),
                             
                             # show this pannel when it is grouped
                             conditionalPanel(
                               condition = sprintf("input['%s'] =='grouped'",ns("GraphType")),
                               fluidRow(
                                 column(6,
                                        # measure 
                                        selectInput(ns("measure3"),"measure",
                                                    c(lift="lift",
                                                      support="support",
                                                      confidence= "confidence"))),
                                 column(6,
                                        # shading
                                        selectInput(ns("shading3"),"shading",
                                                    c(support="support",
                                                      confidence= "confidence",
                                                      lift="lift",
                                                      order="order")))),
                               textInput(ns("max"),"RHS max",value = 10)
                               
                             ),
                             
                             # show this pannel when it is Iplots
                             conditionalPanel(
                               condition = sprintf("input['%s'] =='iplots'",ns("GraphType")),
                               selectInput(ns("engine1"),"engine",
                                           c("default",
                                             "interactive"))),
                             actionButton(ns("Go1"),"Go"),
                             tags$hr(),
                             downloadButton(ns("downloadgraph"), "Download Graph"),
                             width=350),
                           h4(tags$strong(("Static graphs"))),
                           plotOutput(outputId =ns("baseplot"),height = "530px",width = "100%")
                         )
                       )
             ),
             
             nav_panel(title=tags$div(icon("arrow-pointer"),"Interactive graphs"),
                       page_fillable(
                         layout_sidebar(
                           sidebar = sidebar(
                             h4(tags$strong(("Interactive graphs Inputs"))),
                             
                             fluidRow(offset=1,
                                      selectInput(ns("GraphType1"),"Graph Type",
                                                  c(Scatterplot="scatterplot",
                                                    `Two key plot`="two-key plot",
                                                    Matrix="matrix",Graph="graph"),
                                                  width=345
                                      )
                             ), 
                             
                             # show this pannel when it is scatterplot
                             conditionalPanel(
                               condition = sprintf("input['%s'] =='scatterplot'",ns("GraphType1")),
                               
                               fluidRow(
                                 column(6,
                                        selectInput(ns("measure11"),"measure",
                                                    c(lift="lift",
                                                      confidence= "confidence",
                                                      support="support"))),
                                 
                                 column(6,
                                        selectInput(ns("shading11"),"shading",
                                                    c(support="support",confidence= "confidence",lift="lift",order="order")))),
                               selectInput(ns("engine11"),"engine",c("htmlwidget","plotly"))
                             ),
                             
                             # show this pannel when it is Matrix
                             conditionalPanel(
                               condition = sprintf("input['%s'] =='matrix'",ns("GraphType1")),
                               fluidRow(
                                 column(6,
                                        # measure
                                        selectInput(ns("measure12"),"measure",
                                                    c(lift="lift",
                                                      support="support",
                                                      confidence= "confidence"))),
                                 column(6,
                                        # shading
                                        selectInput(ns("shading12"),"shading",
                                                    c(support="support",
                                                      confidence= "confidence",
                                                      lift="lift",order="order")))),
                               selectInput(ns("engine12"),"engine",
                                           c("htmlwidget","plotly"))),
                             
                             # show this pannel when it is two-key plot 
                             conditionalPanel(
                               condition = sprintf("input['%s'] =='two-key plot'",ns("GraphType1")),
                               
                               selectInput(ns("engine13"),"engine",
                                           c("htmlwidget","plotly"))
                               
                             ),
                             
                             # show this pannel when it is graph
                             conditionalPanel(
                               condition = sprintf("input['%s'] =='graph'",ns("GraphType1")),
                               fluidRow(
                                 column(6,
                                        # measure 
                                        selectInput(ns("measure22"),"measure",
                                                    c(lift="lift",
                                                      support="support",
                                                      confidence= "confidence"))),
                                 column(6,
                                        # shading
                                        selectInput(ns("shading22"),"shading",
                                                    c(support="support",
                                                      confidence= "confidence",
                                                      lift="lift",
                                                      order="order")))),
                               selectInput(ns("engine14"),"engine",
                                           c("htmlwidget","visNetwork"))
                               
                             ),
                             
                             # show this pannel when it is grouped
                             conditionalPanel(
                               condition = sprintf("input['%s'] =='grouped'",ns("GraphType1")),
                               fluidRow(
                                 column(6,
                                        # measure 
                                        selectInput(ns("measure32"),"measure",
                                                    c(lift="lift",
                                                      support="support",
                                                      confidence= "confidence"))),
                                 column(6,
                                        # shading
                                        selectInput(ns("shading32"),"shading",
                                                    c(support="support",
                                                      confidence= "confidence",
                                                      lift="lift",
                                                      order="order")))),
                               
                             ),
                             
                             # show this pannel when it is Iplots
                             conditionalPanel(
                               condition = sprintf("input['%s'] =='iplots'",ns("GraphType1")),
                               selectInput(ns("engine16"),"engine",
                                           c("default"))),
                             
                             actionButton(ns("Go2"),"Go"),
                             tags$hr(),
                             width=350),
                           
                           h4(tags$strong(("Interactive graphs"))),
                           conditionalPanel(
                             condition = sprintf("input['%s'] =='graph'",ns("GraphType1")),
                             fluidRow(
                               visNetwork::visNetworkOutput(ns("plot"),height = "530px")), 
                           ),
                           conditionalPanel(
                             condition = sprintf("input['%s'] !='graph'",ns("GraphType1")),
                             fluidRow(
                               plotly::plotlyOutput(ns("plotly"),height = "530px")) 
                           )
                         )
                       )
             ),
    ),
    nav_spacer(),
    
  )
}
marketbasketServer<- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns
    
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
    
    
    datam<-reactive({
      data<-dataInput()
      req(data)
      as(split(data[,"SKUs"],data[,"Row.Labels"]),"transactions")
    })
    
    rules<-reactive({
      datam<-datam()
      req(input$support,input$confidence,input$Maxlen,input$Minlen)
      
      apriori(datam,parameter =list(support=as.numeric(input$support), #Set minimum support
                                    confidence=as.numeric(input$confidence),maxlen=as.numeric(input$Maxlen),minlen=as.numeric(input$Minlen)))
    })
    
    rul1<-reactive({
      rules<-rules()
      nrowq<-nrow(quality(rules))
      if(nrowq==0){
        rul1s<- data.frame(
          LHS = factor(levels = character()),
          RHS = factor(levels = character()),
          support = numeric(),
          confidence = numeric(),
          coverage = numeric(),
          lift = numeric(),
          count = integer())
      } else{
        rul1s<-DATAFRAME(rules)
      }
      rul1s
    })
    
    observeEvent(input$extract,{
      # Rules---------------------------------------------------------------------------------------------------------------------- 
      
      rul1<-rul1()
      
      output$print<-renderPrint({"0 posible rules,either Min support or Min confidence is too high"})
      
      rul<-reactive({
        if (input$remov==TRUE){
          ruls<-rul1%>%filter(count!=0)%>%
            mutate_if(is.numeric,round,digits=2)
          datatable(ruls)
        } else{
          ruls<-rul1%>%
            mutate_if(is.numeric,round,digits=2)
          datatable(ruls)
        }
        ruls
      })
      
      output$contents <- renderUI({
        HTML(kable(rul(),align='l',row.names=F,table.attr ='class="styled-table"',format = "html"))
      })
      
      output$downloadData <- downloadHandler(
        filename = function() {
          paste("rules-", Sys.Date(), ".csv", sep="")
        },
        content = function(file) {
          write.csv(rul(), file)
        }
      )
    }) 
    
    #graphs---------------------------------------------------------------------------------------------------
    
    observeEvent(input$Go1,{
      
      output$baseplot<-renderPlot({
        req(rules())
        #scatter
        if(input$GraphType == "scatterplot")
        {
          plot(rules(), method="scatterplot", measure=input$measure,shading =input$shading)
        }
        # matrix
        else if(input$GraphType =="matrix"){
          if(input$GraphType =="3d"){
            plot(rules(), method="matrix",measure=input$measure1,engine="3d") 
          }
          plot(rules(), method="matrix",measure=input$measure1,shading =input$shading1,engine=input$engine)
        }
        
        # 2key
        else if(input$GraphType =="two-key plot"){
          plot(rules(), method="two-key plot")
        }
        # mosaic
        else if(input$GraphType =="mosaic"){
          ruless<<-rules()
          datamm<<-datam()
          plot(subset(rules())[as.numeric(input$rule1)], method="mosaic",data=datam()) 
        }
        # double decker
        else if(input$GraphType =="doubledecker"){
          plot(subset(rules())[as.numeric(input$rule)], method="doubledecker",data=datam())
        } 
        # parallel 
        else if(input$GraphType =="paracoord"){
          plot(rules(), method="paracoord")
        } 
        # graph
        else if(input$GraphType =="graph"){
          plot(rules(), method="graph",shading=input$shading2,measure =input$measure2)
        }
        # grouped
        else if(input$GraphType =="grouped"){
          plot(rules(), method="grouped",shading=input$shading3,measure =input$measure3,control=list(rhs_max=as.numeric(input$max)))
        }
        # Iplots
        else {
          plot(rules(), method="iplots",engine=input$engine1)
        }
      })
      req(rules())
      output$downloadgraph <- downloadHandler(
        
        filename = function() {
          paste(input$GraphType, Sys.Date(), ".png", sep="")
        },
        content = function(file) {
          png(file)
          if(input$GraphType == "scatterplot")
          {
            plot(rules(), method="scatterplot", measure=input$measure,shading =input$shading)
          }
          # matrix
          else if(input$GraphType =="matrix"){
            if(input$GraphType =="3d"){
              plot(rules(), method="matrix",measure=input$measure1,engine="3d") 
            }
            plot(rules(), method="matrix",measure=input$measure1,shading =input$shading1,engine=input$engine)
          }
          
          # 2key
          else if(input$GraphType =="two-key plot"){
            plot(rules(), method="two-key plot")
          }
          # mosaic
          else if(input$GraphType =="mosaic"){
            plot(subset(rules())[as.numeric(input$rule1)], method="mosaic",data=datam) 
          }
          # double decker
          else if(input$GraphType =="doubledecker"){
            plot(subset(rules())[as.numeric(input$rule)], method="doubledecker",data=datam)
          } 
          # parallel 
          else if(input$GraphType =="paracoord"){
            plot(rules(), method="paracoord")
          } 
          # graph
          else if(input$GraphType =="graph"){
            plot(rules(), method="graph",shading=input$shading2,measure =input$measure2)
          }
          # grouped
          else if(input$GraphType =="grouped"){
            plot(rules, method="grouped",shading=input$shading3,measure =input$measure3,control=list(rhs_max=as.numeric(input$max)))
          }
          # Iplots
          else {
            plot(rules(), method="iplots",engine=input$engine1)
          }
          dev.off()
        }
      )
      
    })
    # interactive graphs-----------------------------------------------------------------------------------------  
    
    observeEvent(input$Go2,{
      req(rules())
      output$plot<-renderVisNetwork({
        plot(rules(), method="graph",shading=input$shading22,measure =input$measure22,engine=input$engine14)
      })
      output$plotly<-renderPlotly({
        #scatter
        if(input$GraphType1 == "scatterplot"){
          if(input$engine11 =="htmlwidget"|input$engine11=="plotly"){
            plot(rules(), method="scatterplot", measure=input$measure11,shading =input$shading11,engine=input$engine11)
          }else{
            plot(rules(), method="scatterplot", measure=input$measure11,shading =input$shading11,engine=input$engine11)
          }
        }
        
        # matrix
        else if(input$GraphType1 =="matrix"){
          if(input$engine12 =="htmlwidget"|input$engine12 =="plotly"){
            plot(rules(), method="matrix",measure=input$measure1,engine=input$engine12) 
          }
          plot(rules(), method="matrix",measure=input$measure12,shading =input$shading12,engine=input$engine12)
        }
        
        # 2key
        else if(input$GraphType1 =="two-key plot"){
          if(input$engine13 =="htmlwidget"|input$engine13 =="plotly"){
            plot(rules(), method="two-key plot",engine=input$engine13)
          }else{
            plot(rules(), method="two-key plot",engine=input$engine13) 
          }
        }
        # Iplots
        else {
          NULL
        }
        
      })
    })
    session$onSessionEnded(function() {
      
      stopApp()
    })
  })
}
