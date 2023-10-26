require 'bundler'
Bundler.require

# Authenticate a session with your Service Account
session = GoogleDrive::Session.from_service_account_key("client_secret.json")


# Get the spreadsheet by its title
spreadsheet = session.spreadsheet_by_title("Copy of Legislators 2017")
# Get the first worksheet
worksheet = spreadsheet.worksheets.first

worksheet.insert_rows(worksheet.num_rows + 1, [["Kumar", "Saravanan", "15/1/1983", "M", "sen", "TN"]])
worksheet.save
puts "insert successfully"

# Print out the first 6 columns of each row
#worksheet.rows.each { |row| puts row.first(6).join(" | ") }

