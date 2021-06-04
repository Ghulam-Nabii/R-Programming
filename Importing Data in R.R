### Importing Data in R 
library(readr)
df <- read_csv("msleep_ggplot2.csv")
str(df)
read.table("msleep_ggplot2.csv",header = TRUE,sep = ",",stringsAsFactors = FALSE)
read_delim("msleep_ggplot2.csv",delim = ",",col_types = "cccccdddddd",
           skip = 2,n_max = 3,col_names = c("name","genus","vore","order",
                                            "conservation","sleep_total","sleep_rem",
                                            "sleep_cycle","awake","brainwt","bodywt"))

#### Importing data from excel in R
library(readxl)

excel_sheets("msleep_ggplot22.xlsx") 
read_excel("msleep_ggplot22.xlsx",col_types = c("text","text","text",
"text","text","numeric","numeric","numeric","numeric","blank","blank"),skip = 2)
install.packages("gdata")
library(gdata)

read.xls("msleep_ggplot22.xls")


library(readxl)
lapply(excel_sheets("msleep_ggplot22.xlsx"),read_excel,path = "msleep_ggplot22.xlsx")



## Database
library(DBI)

con <- dbConnect(RMySQL::MySQL(),dbname = "company", 
                 host = "courses.csrrinzqubik.us-east-1.rds.amazonaws.com",
                 port = 3306,
                 user = "student",
                 password = "datacamp")
con

## listing all tables 
table_names <- dbListTables(con)

lapply <- lapply(table_names,dbReadTable,conn = con)
dbDisconnect(con)
lapply

## query 

employees <- dbReadTable(con,"employees")
employees
subset(employees,subset = started_at > "2012-09-01",select = name)

## best alternative 
dbGetQuery(con,"SELECT name FROM employees WHERE started_at > '2012-09-01'")

## example 2 query 
dbGetQuery(con,"SELECT * FROM products WHERE contract = 1")

res <- dbSendQuery(con,"SELECT * FROM products WHERE contract = 1")
dbFetch(res)
dbClearResult(res)

## dbfetch one by one 
while(!dbHasCompleted(res)) {
        chunk <- dbFetch(res,n=1)
        print(chunk)
}
dbClearResult(res)
dbDisconnect(con)

### Download data from web
library(readxl)
read_csv("http://s3.amazonaws.com/
assets.datacamp.com/course/
importing_
data
_
into
_
r/states.csv")


url <-
        "http://s3.amazonaws.com/assets.datacamp.com/
course/importing_
data
_
into
_
r/cities.xlsx"

download.file(url,destfile = "cities.xlsx")
read_excel("cities.xlsx")


library(httr)

url <- "http://www.example.com/"
resp <- GET(url)
resp

raw_content <- content(resp,"parsed")
raw_content

### Working with JSON and API
install.packages("jsonlite")
library(jsonlite)

wine_json <- '{"name":"Chateau Migraine","year":1997,"alcohol_pct":12.4,
"color":"red","awarded":false}'
fromJSON(wine_json)
str(fromJSON(wine_json))


# The package jsonlite is already loaded
library(jsonlite)
# Definition of the URLs
url_sw4 <- "http://www.omdbapi.com/?apikey=72bc447a&i=tt0076759&r=json"
url_sw3 <- "http://www.omdbapi.com/?apikey=72bc447a&i=tt0121766&r=json"

# Import two URLs with fromJSON(): sw4 and sw3
sw4 <- fromJSON(url_sw4)
sw3 <- fromJSON(url_sw3)

# Print out the Title element of both lists
sw3$Title
sw4$Title

# Is the release year of sw4 later than sw3?
sw4$Year > sw3$Year

## Jsonlite functions
library(jsonlite)
json1 <- '[1,2,3,4,5,6]'
fromJSON(json1)

json2 <- '{"a": [1,2,3],"b": [4,5,6]}'
fromJSON(json2)

json3 <- '[[1,2],[3,4]]'
fromJSON(json3)

json4 <- '[{"a":1,"b":2},{"a":3,"b":4},{"a":5,"b":6}]'
fromJSON(json4)

r <- fromJSON('{"id":1,
"name":"Frank"
,
"age":23,
"married":false,
"partner":{"id":4,
"name":"Julie"}}')
r


url_csv <- "http://s3.amazonaws.com/assets.datacamp.com/production/course_1478/datasets/water.csv"
water <- read.csv(url_csv)
water
toJSON(water)
pretty_json <- toJSON(mtcars,pretty = TRUE)
pretty_json
minify(pretty_json)
prettify(pretty_json)

### Importing Data from Statistical Softwares
install.packages("haven")
install.packages("foreign")
## SAS
library("haven")

