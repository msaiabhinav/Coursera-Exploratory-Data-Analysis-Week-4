    ## start
  ##  reading the emission data and classification code given
 emissions_data <- readRDS( "summarySCC_PM25.rds" )
 class_code <- readRDS( "Source_Classification_Code.rds" )

                                                                     ## subset to just data from Baltimore and then add up emissions of evry year
            baltimore_data  <-  subset(emissions_data, emissions_data$fips=="24510" 
   baltimore_data_year  <-  aggregate(baltimore_data$Emissions, by=list(baltimore_data$year ), 
                                   FUN=sum)
                                                                      ## creating the   plot
## labelling X and Y and giving a title
       png(filename = "plot2.png")
       plot(baltimore_data_year$Group.1, baltimore_data_year$x, type = "l" , 
        main = "Total Emissions of PM2.5 in Baltimore City", xlab = "year" , 
        ylab = "Total Emissions (tons)")
dev.off()


## end of the program
