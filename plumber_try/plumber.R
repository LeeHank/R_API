#
# This is a Plumber API. You can run the API by clicking
# the 'Run API' button above.
#
# Find out more about building APIs with Plumber here:
#
#    https://www.rplumber.io/
#

library(plumber)

#* @apiTitle Plumber Example API

#* Echo back the input
#* @param msg The message to echo
#* @get /echo
function(msg = "") {
    list(msg = paste0("The message is: '", msg, "'"))
}

#* Plot a histogram
#* @png
#* @get /plot
function() {
    rand <- rnorm(100)
    hist(rand)
}

#* Return the sum of two numbers
#* @param a The first number to add
#* @param b The second number to add
#* @post /sum
function(a, b) {
    as.numeric(a) + as.numeric(b)
}

#* hahahahahahaha
#* @param csv_file:file csv_file 是參數名稱(可隨意訂), :file 是指格式是file, 在 swagger 上就可上傳file
#* @post /upload_csv
function(req, csv_file) {
  #browser()
  # f 是一個 list, 第一個 element 會是字串
  # 例如 "Name,Age,Gender\nJohn,30,Male\nJane,25,Female"
  csv_string = csv_file[[1]]
  # 使用 textConnection 將字串轉換成連接物件
  con <- textConnection(csv_string, "r")
  # 使用 read.csv 從連接物件中讀取資料
  df = read.csv(con)
  print(df)
  return("cool!!")
}

