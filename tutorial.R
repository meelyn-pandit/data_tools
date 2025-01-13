library(celltracktech)
library(DBI)
library(RPostgres)
library(duckdb)

start <- Sys.time()

###settings###
# my_token <- 'token'
my_token <- "c2ed5f935e9b9d4c2e031f8a96277317b7502d989add5947656dbfbeee7082c5"

db_name <- 'tutorial_db'
myproject <- 'Meadows V2' # this is your project name on your CTT account
# conn <- dbConnect(RPostgres::Postgres(), dbname=db_name)
conn <- DBI::dbConnect(duckdb::duckdb(), dbdir = db_name, read_only = FALSE)
#########
outpath <- "./data"
# get_my_data(my_token, outpath, conn, myproject=myproject)
get_my_data(my_token, outpath, con, myproject=myproject, begin=as.Date("2023-08-01"), end=as.Date("2023-08-02"), filetypes=c("raw", "node_health"))
update_db(conn, outpath, myproject)
dbDisconnect(conn)

#findfiles(outpath, 'directory path where you want your caught files to go')

time_elapse <- Sys.time() - start

print(time_elapse)