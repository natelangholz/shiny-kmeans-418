# k-means only works with numerical variables,
# so don't give the user the option to select
# a categorical variable
vars <- setdiff(names(iris), "Species")

library(shiny)
library(bslib)

page_sidebar(
  title ="Iris Modeling",
  headerPanel('Iris k-means clustering'),
  sidebar = sidebar(
      width = 325,
      selectInput('xcol', 'X Variable', vars),
      selectInput('ycol', 'Y Variable', vars, selected = vars[[2]]),
      numericInput('clusters', 'Cluster count', 3, min = 1, max = 9),
      numericInput('seplen', "Pick a Sepal Length",
                    min = 4, max = 8, value = 3),
      numericInput('petwid', "Pick a Petal Width",
                    min = 4, max = 10, value = 5)    ),
   mainPanel(
    plotOutput('plot1')),
   "The Predicted Petal Length for your selected Sepal Length and Petal Width is:",
    h3(textOutput("random_number"))

)