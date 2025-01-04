#pkgss = c("Rgraphviz","shiny","tidyverse","arules","arulesViz","colorspace","visNetwork","plotly","igraph","shinythemes","readxl", "DT")
#lapply(pkgss,require,character.only=TRUE)
shinyUI(
navbarPage("Association Rule Miner",theme = shinythemes::shinytheme("cerulean"),
           tabPanel("Rules",
                    fillPage(
                      sidebarPanel(width = 4,
                                   fluidRow(offset=1,style="border: 4px inset;",
                                            h4(tags$strong(("Data upload"))),
                                            fileInput("file1", "Choose CSV File",
                                                      accept = c(
                                                        "text/csv",
                                                        "text/comma-separated-values,text/plain",
                                                        ".csv")
                                            ),
                                            checkboxInput("header", "Header", TRUE),
                                            selectInput("csv", "file type",
                                                        c("csv","excel"))
                                   ),
                                   fluidRow(offset=1,style="border: 4px inset;",
                                            h4(tags$strong(("Rules inputs"))),
                                            fluidRow(
                                              column(4,offset=1,
                                                     # minimum support
                                                     numericInput(inputId = "support",label = "Min Support",value=0)),
                                              column(4,offset=1,
                                                     # minimum Confidence
                                                     numericInput(inputId = "confidence",label = "Min confidence",value=0))),
                                            
                                            fluidRow(
                                              column(4,offset=1,
                                                     # Min len
                                                     numericInput(inputId = "Minlen",label = "Min length",value=2)),
                                              column(4,offset=1,
                                                     # max len
                                                     numericInput(inputId = "Maxlen",label = "max length",value=2))),
                                            # Remove rules with count 0
                                            
                                            checkboxInput("remov", "exclude zero counts", FALSE),
                                            actionButton("extract","mine Rules"),
                                            # Button
                                            downloadButton("downloadData", "Download Rules")
                                   )
                                   
                      ),
                      
                      mainPanel(
                        h4(tags$strong(("Rules"))),
                        conditionalPanel(
                        dataTableOutput("contents"))
                      )
                    )),
           # Graph  tab will be inserted here--------------------------------------------------------------------------------------------------------------
           navbarMenu("Graphing",
                      tabPanel("Static graphs",
                               fillPage(
                                 sidebarPanel(width = 4,
                                              # Basic------------------------------------------------------------------------------------------
                                              
                                              fluidRow(style="border: 4px inset;", 
                                                       h4(tags$strong(("Static graphs Inputs"))),
                                                       fluidRow(offset=1,
                                                                column(12,
                                                                       selectInput("GraphType","Graph Type",
                                                                                   c(Scatterplot="scatterplot",`Two key plot`="two-key plot",
                                                                                     Matrix="matrix",Mosaic="mosaic",
                                                                                     Doubledecker="doubledecker",Graph="graph",Paracoord="paracoord",
                                                                                     Grouped="grouped"))
                                                                )), 
                                                       
                                                       fluidRow(offset=1,
                                                                # show this pannel when it is scatterplot
                                                                conditionalPanel(
                                                                  condition = "input.GraphType=='scatterplot'",
                                                                  fluidRow(
                                                                    column(4,offset=1,style="width:140px",
                                                                           selectInput("measure","measure",
                                                                                       c(lift="lift",confidence= "confidence",support="support"))),
                                                                    
                                                                    column(4,style="width:140px",
                                                                           selectInput("shading","shading",
                                                                                       c(support="support",confidence= "confidence",lift="lift",order="order"))))
                                                                ),
                                                                
                                                                # show this pannel when it is Matrix
                                                                conditionalPanel(
                                                                  condition = "input.GraphType=='matrix'",
                                                                  fluidRow(
                                                                    column(4,offset=1,style="width:140px",
                                                                           # measure
                                                                           selectInput("measure1","measure",
                                                                                       c(lift="lift",support="support",confidence= "confidence"))),
                                                                    column(4,style="width:140px",
                                                                           # shading
                                                                           selectInput("shading1","shading",
                                                                                       c(support="support",confidence= "confidence",lift="lift",order="order")))),
                                                                  column(12,
                                                                         fluidRow(
                                                                           column(12,
                                                                                  selectInput("engine","engine",
                                                                                              c("3d","default")))))),
                                                                
                                                                # show this pannel when it is two-key plot 
                                                                conditionalPanel(
                                                                  condition = "input.GraphType=='two-key plot'",
                                                                  fluidRow()
                                                                ),
                                                                # show this pannel when it is doubledecker
                                                                conditionalPanel(
                                                                  condition = "input.GraphType=='doubledecker'",
                                                                  column(12,
                                                                         fluidRow(
                                                                           column(12,
                                                                                  textInput("rule","Rule Number",value=1))))
                                                                ),
                                                                # show this pannel when it is mosaic
                                                                conditionalPanel(
                                                                  condition = "input.GraphType=='mosaic'",
                                                                  column(12,
                                                                         fluidRow(
                                                                           column(12,
                                                                                  textInput("rule1","Rule Number",value=1))))),
                                                                
                                                                # show this pannel when it is paracoord. 
                                                                conditionalPanel(
                                                                  condition = "input.GraphType=='paracoord'",
                                                                  fluidRow()
                                                                ),
                                                                
                                                                # show this pannel when it is graph
                                                                conditionalPanel(
                                                                  condition = "input.GraphType=='graph'",
                                                                  fluidRow(
                                                                    column(4,offset=1,style="width:140px",
                                                                           # measure 
                                                                           selectInput("measure2","measure",
                                                                                       c(lift="lift",support="support",confidence= "confidence"))),
                                                                    column(4,style="width:140px",
                                                                           # shading
                                                                           selectInput("shading2","shading",
                                                                                       c(support="support",confidence= "confidence",lift="lift",order="order"))))
                                                                  
                                                                ),
                                                                # show this pannel when it is grouped
                                                                conditionalPanel(
                                                                  condition = "input.GraphType=='grouped'",
                                                                  fluidRow(
                                                                    column(4,offset=1,style="width:140px",
                                                                           # measure 
                                                                           selectInput("measure3","measure",
                                                                                       c(lift="lift",support="support",confidence= "confidence"))),
                                                                    column(4,style="width:140px",
                                                                           # shading
                                                                           selectInput("shading3","shading",
                                                                                       c(support="support",confidence= "confidence",lift="lift",order="order"))),
                                                                    fluidRow(
                                                                      column(12,offset=1,style="width:300px",
                                                                             textInput("max","RHS max",value = 10))
                                                                    ))
                                                                  
                                                                ),
                                                                # show this pannel when it is Iplots
                                                                conditionalPanel(
                                                                  condition = "input.GraphType=='iplots'",
                                                                  fluidRow(
                                                                    column(12,
                                                                           selectInput("engine1","engine",
                                                                                       c("default","interactive")))))
                                                       ),
                                                       
                                                       fluidRow(offset=1,
                                                                column(12,
                                                                       actionButton("Go1","Go",style="width:140px"))
                                                       ),
                                                       tags$hr(),
                                                       fluidRow(offset=1,
                                                                column(12,
                                                                       downloadButton("downloadgraph", "Download Graph"))
                                                                
                                                       )
                                              )),
                                 mainPanel(style="border: 4px inset;",
                                           
                                           h4(tags$strong(("Static graphs"))),
                                           plotOutput(outputId ="baseplot",height = "530px",width = "100%")
                                 
                                 )
                               )),
                      
                      tabPanel("Interactive graphs",
                               fillPage(
                                 sidebarPanel(width = 4,
                                              h4(tags$strong(("Interactive graphs Inputs"))),
                                              fluidRow(style="border: 4px inset;",
                                                       fluidRow(offset=1,
                                                                column(12,
                                                                       selectInput("GraphType1","Graph Type",
                                                                                   c(Scatterplot="scatterplot",`Two key plot`="two-key plot",
                                                                                     Matrix="matrix",Graph="graph")))
                                                       ), 
                                                       
                                                       fluidRow(offset=1,
                                                                # show this pannel when it is scatterplot
                                                                conditionalPanel(
                                                                  condition = "input.GraphType1=='scatterplot'",
                                                                  fluidRow(
                                                                    column(4,offset=1,style="width:140px",
                                                                           selectInput("measure11","measure",
                                                                                       c(lift="lift",confidence= "confidence",support="support"))),
                                                                    
                                                                    column(4,style="width:140px",
                                                                           selectInput("shading11","shading",
                                                                                       c(support="support",confidence= "confidence",lift="lift",order="order")))),
                                                                  column(12,
                                                                         fluidRow(
                                                                           column(12,
                                                                                  selectInput("engine11","engine",
                                                                                              c("htmlwidget","plotly")))))
                                                                ),
                                                                
                                                                # show this pannel when it is Matrix
                                                                conditionalPanel(
                                                                  condition = "input.GraphType1=='matrix'",
                                                                  fluidRow(
                                                                    column(4,offset=1,style="width:140px",
                                                                           # measure
                                                                           selectInput("measure12","measure",
                                                                                       c(lift="lift",support="support",confidence= "confidence"))),
                                                                    column(4,style="width:140px",
                                                                           # shading
                                                                           selectInput("shading12","shading",
                                                                                       c(support="support",confidence= "confidence",lift="lift",order="order")))),
                                                                  column(12,
                                                                         fluidRow(
                                                                           column(12,
                                                                                  selectInput("engine12","engine",
                                                                                              c("htmlwidget","plotly")))))),
                                                                
                                                                # show this pannel when it is two-key plot 
                                                                conditionalPanel(
                                                                  condition = "input.GraphType1=='two-key plot'",
                                                                  column(12,
                                                                         fluidRow(
                                                                           column(12,
                                                                                  selectInput("engine13","engine",
                                                                                              c("htmlwidget","plotly")))))
                                                                  
                                                                ),
                                                                # show this pannel when it is graph
                                                                conditionalPanel(
                                                                  condition = "input.GraphType1=='graph'",
                                                                  fluidRow(
                                                                    column(4,offset=1,style="width:140px",
                                                                           # measure 
                                                                           selectInput("measure22","measure",
                                                                                       c(lift="lift",support="support",confidence= "confidence"))),
                                                                    column(4,style="width:140px",
                                                                           # shading
                                                                           selectInput("shading22","shading",
                                                                                       c(support="support",confidence= "confidence",lift="lift",order="order")))),
                                                                  column(12,
                                                                         fluidRow(
                                                                           column(12,
                                                                                  selectInput("engine14","engine",
                                                                                              c("htmlwidget","visNetwork")))))
                                                                  
                                                                ),
                                                                # show this pannel when it is grouped
                                                                conditionalPanel(
                                                                  condition = "input.GraphType1=='grouped'",
                                                                  fluidRow(
                                                                    column(4,offset=1,style="width:140px",
                                                                           # measure 
                                                                           selectInput("measure32","measure",
                                                                                       c(lift="lift",support="support",confidence= "confidence"))),
                                                                    column(4,style="width:140px",
                                                                           # shading
                                                                           selectInput("shading32","shading",
                                                                                       c(support="support",confidence= "confidence",lift="lift",order="order")))),
                                                                  
                                                                ),
                                                                # show this pannel when it is Iplots
                                                                conditionalPanel(
                                                                  condition = "input.GraphType1=='iplots'",
                                                                  fluidRow(
                                                                    column(12,
                                                                           selectInput("engine16","engine",
                                                                                       c("default")))))
                                                       ),
                                                       
                                                       fluidRow(offset=1,
                                                                column(12,
                                                                       actionButton("Go2","Go",style="width:140px"))
                                                       ),
                                                       tags$hr()
                                              )),
                                 mainPanel(
                                   fluidRow(style="border: 4px inset;",
                                            h4(tags$strong(("Interactive graphs"))),
                                            conditionalPanel(
                                              condition = "input.GraphType1=='graph'",
                                              fluidRow(
                                                visNetwork::visNetworkOutput("plot",height = "530px")), 
                                            ),
                                            conditionalPanel(
                                              condition = "input.GraphType1!='graph'",
                                              fluidRow(
                                                plotly::plotlyOutput("plotly",height = "530px")) 
                                            ))
                                 )
                               )
                      )
           )
)
)