@@ -5,10 +5,14 @@ SCC <- readRDS("Source_Classification_Code.rds")
  # Sample data for testing
  NEIsample <- NEI[sample(nrow(NEI), size=1000, replace=F), ]
  
 +# Aggregate
 +Emissions <- aggregate(NEI[, 'Emissions'], by=list(NEI$year), FUN=sum)
 +Emissions$PM <- round(Emissions[,2]/1000,2)
 +

  png(filename='plot1.png')
 -barplot(tapply(X=NEI$Emissions, INDEX=NEI$year, FUN=sum),
 -        main=expression('Total Emission of PM'[2.5]), xlab='Year', ylab=expression('PM'[2.5]))
 +barplot(Emissions$PM, names.arg=Emissions$Group.1, 
 +        main=expression('Total Emission of PM'[2.5]), xlab='Year', ylab=expression(paste('PM', ''[2.5], ' in Kilotons')))
  dev.off()
