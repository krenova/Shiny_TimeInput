ui <- fluidPage(
	title = 'Using Time input type in Shiny, an example:',
	
	fluidRow(
		div( id = "main",
			column(width = 12, 
				tags$label("Time", `for` = "ui_time"),
				HTML('<br><input id="ui_time" type="time", value = ""><br><br>')
			 ),
			column(width = 12, 
				h3(textOutput("output_datetime"))
			 ),
			HTML('<script>
						document.getElementById("ui_time").onchange = function() {
							var time = document.getElementById("ui_time").value;
							Shiny.onInputChange("input_time", time);
						};
						</script>
				')
		)
    )
)

server <- function(input, output, session) {
  output$output_datetime  <- renderText({
		paste0("Your have entered the following time: ", input$input_time)
    })
}
 

shinyApp(ui = ui,server = server)
