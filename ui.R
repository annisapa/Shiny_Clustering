library(rattle.data)
library(ppclust)
data<-wine[,-1]
data

vars <- setdiff(names(data), "Species")

pageWithSidebar(
  headerPanel('Wine Fuzzy C-means clustering'),
  sidebarPanel(
    selectInput('xcol', 'X Variable', vars),
    selectInput('ycol', 'Y Variable', vars, selected = vars[[2]]),
    numericInput('clusters', 'Cluster count', 3, min = 1, max = 10)
  ),
  mainPanel(
    plotOutput('plot1')
  )
)