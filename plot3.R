 ## starting the program

  ##   reading the emissions  data  and  classification  code 
   emissions_data <- readRDS ( "summarySCC_PM25.rds" )
   class_code <- readRDS (" Source_Classification_Code.rds " )

                                                          ## subset to just data from Baltimore and summing up the emissions by variable each TYPE
    baltimore_data <- subset ( emissions_data, emissions_data$fips=="24510" )
      baltimore_type_year <- aggregate( baltimore_data$Emissions , 
                                 by=list ( baltimore_data$type , baltimore_data$year ) , 
                                 FUN=sum)
 colnames(baltimore_type_year) <- c(" Type ", " Year ", " Emissions " )

                                                        ## creating plot with the help of ggplot2
 library(ggplot2) ## calling
        png(filename = "plot3.png") ##giving title
##labelling x and y
        qplot(Year, Emissions, data = baltimore_type_year, color = Type, geom = "line")   +
        ggtitle("Total Emissions of PM2.5 in Baltimore City By pollutant type")  + 
        ylab( "Total Emissions (tons)" )  + 
         xlab( "Year" ) 
dev.off()


## end of the program

        
