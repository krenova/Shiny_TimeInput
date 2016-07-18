ui <- fluidPage(
	title = 'Time inputs in Shiny',
	div( id = "eg1",
		fluidRow(
			column(width = 11, offset = 1, 
				HTML('<br>'),
				h4('Example 1: Using HTML time input type'),
				tags$label("Time", `for` = "ui_time"),
				HTML('<br><input id="ui_time" type="time", value = ""><br><br>'),
				h4(textOutput("output_html"))
			 ),
			HTML('<script>
					document.getElementById("ui_time").onchange = function() {
						var time = document.getElementById("ui_time").value;
						Shiny.onInputChange("input_html", time);
					};
				</script>')
		),
		shiny::hr()
    ),
	div( id = "eg2",
		fluidRow(
			column(width = 11, offset = 1,
				h4('Example 2: Using Sliders (1)'),
				sliderInput("slider_hours", "Hours:", 
					min=0, max=23, value=0, step = 1),
				sliderInput("slider_mins", "Mins:", 
						min = 0, max = 59, value = 0, step = 1),
				h4(textOutput("output_slider"))
			 )
		),
		shiny::hr()
	),
	div( id = "eg3",
		fluidRow(
			column(width = 11, offset = 1,
				h4('Example 3: Using Sliders (2)'),
				sliderInput("slider_datetime", "Date & Time:", 
					min=as.POSIXlt("2010-01-01 00:00:00", "GMT"),
					max=as.POSIXlt("2020-01-01 23:59:59", "GMT"),
					value=as.POSIXlt("2010-01-01 00:00:00", "GMT"),
					timezone = "GMT"),
				h4(textOutput("output_slider2"))
			 )
		)
	)
)

server <- function(input, output, session) {
  output$output_html  <- renderText({
		paste("Your have entered the following date time: ", input$input_html)
    })
  output$output_slider  <- renderText({
		paste0("Your have entered the following time: ", input$slider_hours, ":", input$slider_mins)
    })
  output$output_slider2  <- renderText({
		paste0("Your have entered the following time: ", input$slider_datetime)
    })
}
 

shinyApp(ui = ui,server = server)
