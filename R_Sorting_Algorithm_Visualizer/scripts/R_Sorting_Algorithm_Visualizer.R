library(shiny)
library(ggplot2)



# ---- Bubble sort ----
bubble_sort_states <- function(arr){
  
  states <- list()
  n <- length(arr)
  sorted <- c()
  
  # ---- add state ----
  add_state <- function(arr, comparing=NULL, sorted=NULL){
    states[[length(states)+1]] <<- list(
      arr = arr,
      comparing = comparing,
      sorted = sorted
    )
  }
  
  # initial state
  add_state(arr)
  
  for(i in 1:(n-1)){
    for(j in 1:(n-i)){
      
      # coloring comparing items red
      add_state(arr, comparing=c(j,j+1), sorted=sorted)
      
      if(arr[j] > arr[j+1]){
        #swaping items
        tmp <- arr[j]
        arr[j] <- arr[j+1]
        arr[j+1] <- tmp
        # add red coloring to swapped items
        add_state(arr, comparing=c(j,j+1), sorted=sorted)
      }
    }
    # coloring sorted item green
    sorted <- c(sorted, n-i+1)
    add_state(arr, sorted=sorted)
  }
  # coloring in the last item
  sorted <- c(sorted,1)
  add_state(arr, sorted=sorted)
  
  return (states)
}

# ---- Selection sort ----
selection_sort_states <- function(arr){
  # setup
  states <- list()
  n <- length(arr)
  sorted <- c()
  
  # ---- add state ----
  add_state <- function(arr, comparing=NULL, sorted=NULL){
    states[[length(states)+1]] <<- list(
      arr = arr,
      comparing = comparing,
      sorted = sorted
    )
  }
  
  # adding initial step
  add_state(arr)
  
  for (i in 1:(n - 1)) {
    min_index <- i
    for (j in (i + 1):n) {
      add_state(arr, comparing=c(j,min_index), sorted=sorted)
      if (arr[j] < arr[min_index]) {
        min_index <- j
      }
    }
    # swaping min_index to leftmost unsorted index
    if (min_index != i) {
      temp <- arr[i]
      arr[i] <- arr[min_index]
      arr[min_index] <- temp
    }
    # coloring sorted item green
    sorted <- c(sorted, i)
    add_state(arr, sorted=sorted)
  }
  # coloring in the last item
  sorted <- c(sorted,n)
  add_state(arr, sorted=sorted)
  
  return (states)
}

# ---- Insertion sort ----
insertion_sort_states <- function(arr) {
  # setup
  states <- list()
  n <- length(arr)
  sorted <- c()
  rel_sorted <- c()
  
  # ---- add state ----
  add_state <- function(arr, comparing=NULL, rel_sorted = NULL, sorted=NULL){
    states[[length(states)+1]] <<- list(
      arr = arr,
      comparing = comparing,
      rel_sorted = rel_sorted,
      sorted = sorted
    )
  }
  
  # adding initial step
  add_state(arr)
  
  for (i in 2:n) {
    key <- arr[i]
    j <- i - 1
    
    # move to right until index gets bigger than key
    add_state(arr, comparing=c(j,i),rel_sorted = rel_sorted, sorted=sorted)
    while (j > 0 && arr[j] > key) {
      #add_state(arr, comparing=c(j,j+1), rel_sorted = rel_sorted,sorted=sorted)
      arr[j + 1] <- arr[j]
      # add_state(arr, comparing=c(j,j+1),rel_sorted = rel_sorted, sorted=sorted)
      j <- j - 1
    }
    
    # swap key
    arr[j + 1] <- key
    # coloring sorted item green
    rel_sorted <- 1:i
    add_state(arr, rel_sorted = rel_sorted,sorted=sorted)
  }
  sorted <- 1:i
  add_state(arr, sorted=sorted)
  return (states)
}

# ---- Heap sort ---- 
# TODO fix to work with uneven array sizes
adjust_heap <- function(arr, k, n, heap_env, sorted=NULL){
  
  left <- 2*k
  right <- 2*k+1
  max <- k
  
  if(k <= n/2){
    
    if(left <= n && arr[left] > arr[max]){
      max <- left
      heap_env$states[[length(heap_env$states)+1]] <- list(arr=arr, comparing=c(k,left), sorted=sorted)
    }
    
    if(right <= n && arr[right] > arr[max]){
      max <- right
      heap_env$states[[length(heap_env$states)+1]] <- list(arr=arr, comparing=c(k,right), sorted=sorted)
    }
    
    if(max != k){
      temp <- arr[k]
      arr[k] <- arr[max]
      arr[max] <- temp
      
      heap_env$states[[length(heap_env$states)+1]] <- list(arr=arr, comparing=c(k,max), sorted=sorted)
      
      arr <- adjust_heap(arr, max, n, heap_env, sorted)
    }
  }
  
  return(arr)
}

create_heap <- function(arr, n, heap_env, sorted){
  for(i in (n/2):1){
    arr <- adjust_heap(arr, i, n, heap_env, sorted)
  }
  return(arr)
}

heap_sort_states <- function(arr){
  
  heap_env <- new.env()
  heap_env$states <- list()
  
  sorted <- c()
  
  n <- length(arr)
  arr <- create_heap(arr, n, heap_env, sorted)

  
  add_state <- function(arr, comparing=NULL, sorted=NULL){
    heap_env$states[[length(heap_env$states)+1]] <- list(
      arr = arr,
      comparing = comparing,
      sorted = sorted
    )
  }
  
  add_state(arr)
  
  for(i in 1:n){
    add_state(arr, comparing=c(1, n-i+1), sorted=sorted)
    temp <- arr[n-i+1]
    arr[n-i+1] <- arr[1]
    arr[1] <- temp
    sorted <- c(sorted, n-i+1)
    add_state(arr, sorted=sorted)
    arr <- adjust_heap(arr, 1, n-i, heap_env, sorted=sorted)
    
    
  }
  
  # sorted <- c(sorted,n)
  # add_state(arr, sorted=sorted)
  
  return(heap_env$states)
}



# ---- Algorithm registry ----

algorithms <- list(
  "Bubble Sort" = bubble_sort_states,
  "Selection Sort" = selection_sort_states,
  "Insertion Sort" = insertion_sort_states,
  "Heap Sort" = heap_sort_states
)

# ---- UI ----

ui <- fluidPage(
  
  titlePanel("Sorting Algorithm Visualizer"),
  
  sidebarLayout(
    
    sidebarPanel(
      
      sliderInput("size","Array Size",5,50,20),
      
      sliderInput("speed","Animation Speed (ms)",1,200,50),
      
      selectInput(
        "algorithm",
        "Algorithm",
        choices = names(algorithms)
      ),
      
      actionButton("generate","Generate Array"),
      actionButton("start","Start Sorting")
      
    ),
    
    mainPanel(
      plotOutput("plot", height="450px")
    )
  )
)

# ---- Server ----

server <- function(input, output, session){
  
  values <- reactiveValues(
    arr=NULL,
    states=NULL,
    step=1
  )
  
  observeEvent(input$generate,{
    values$arr <- sample(1:input$size)
    values$states <- NULL
    values$step <- 1
  })
  
  observeEvent(input$start,{
    
    req(values$arr)
    
    algo <- algorithms[[input$algorithm]]
    
    values$states <- algo(values$arr)
    values$step <- 1
    
  })
  
  observe({
    
    req(values$states)
    
    invalidateLater(input$speed, session)
    
    isolate({
      if(values$step < length(values$states)){
        values$step <- values$step + 1
      }
    })
    
  })
  
  output$plot <- renderPlot({
    
    state <- if(!is.null(values$states)){
      values$states[[values$step]]
    } else {
      list(arr = values$arr, comparing=NULL, rel_sorted = NULL, sorted=NULL)
    }
    
    req(state$arr)
    
    df <- data.frame(
      index = 1:length(state$arr),
      value = state$arr,
      type = "normal"
    )
    
    if(!is.null(state$comparing)){
      df$type[df$index %in% state$comparing] <- "comparing"
    }
    
    if(!is.null(state$sorted)){
      df$type[df$index %in% state$sorted] <- "sorted"
    }
    if(!is.null(state$rel_sorted)){
      df$type[df$index %in% state$rel_sorted] <- "rel_sorted"
    }
    
    ggplot(df, aes(index,value,fill=type)) +
      geom_col() +
      scale_fill_manual(values=c(
        normal="steelblue",
        comparing="red",
        rel_sorted = "orange",
        sorted="green"
      )) +
      ylim(0,max(df$value)+1) +
      theme_minimal(base_size=16) +
      labs(
        title=paste("Step",values$step),
        x="Index",
        y="Value",
        fill=""
      )
    
  })
  
}

shinyApp(ui,server)