require 'bundler'
Bundler.require

# Authenticate a session with your Service Account
session = GoogleDrive::Session.from_service_account_key("client_secret.json")

# Get the spreadsheet by its title
spreadsheet = session.spreadsheet_by_title("Copy of Legislators 2017")
# Get the first worksheet
worksheet = spreadsheet.worksheets.first


name_to_find = "Dharani" # Replace with the name you want to search for

# Find the row number based on the name
row_number = worksheet.rows.find_index { |row| row[1] == name_to_find } + 1 # Assuming name is in the first column (index 0)
worksheet[row_number, 3] = "24/3/2005"
worksheet.save
puts "updated"

# Print out the first 6 columns of each row
worksheet.rows.each { |row| puts row.first(6).join(" | ") }

