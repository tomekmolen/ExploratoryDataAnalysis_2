@@ -5,10 +5,14 @@ SCC <- readRDS("Source_Classification_Code.rds")
  # Sample data for testing
  NEIsample <- NEI[sample(nrow(NEI), size=1000, replace=F), ]
  
 +# Aggregate
 +Emissions <- aggregate(NEI[, 'Emissions'], by=list(NEI$year), FUN=sum)
 +Emissions$PM <- round(Emissions[,2]/1000,2)
 +
  # Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
  # Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
  # for each of the years 1999, 2002, 2005, and 2008.
  png(filename='plot1.png')
 -barplot(tapply(X=NEI$Emissions, INDEX=NEI$year, FUN=sum),
 -        main=expression('Total Emission of PM'[2.5]), xlab='Year', ylab=expression('PM'[2.5]))
 +barplot(Emissions$PM, names.arg=Emissions$Group.1, 
 +        main=expression('Total Emission of PM'[2.5]), xlab='Year', ylab=expression(paste('PM', ''[2.5], ' in Kilotons')))
  dev.off()
