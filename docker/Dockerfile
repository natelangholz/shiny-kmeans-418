# Base R Shiny image
FROM rocker/shiny

# Make a directory in the container
RUN mkdir /home/shiny-app

# Install R dependencies
RUN R -e 'install.packages(c("bslib","jsonlite","httr"))'

# Copy the Shiny app code
COPY . /home/shiny-app/

# Expose the application port
EXPOSE 8080

# Run the R Shiny app
CMD ["R", "-e", "shiny::runApp('/home/shiny-app',host='0.0.0.0',port=8080)"]
