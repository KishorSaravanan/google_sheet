require 'bundler'
Bundler.require

# Authenticate a session with your Service Account
session = GoogleDrive::Session.from_service_account_key("client_secret.json")

# Get the spreadsheet by its title
spreadsheet = session.spreadsheet_by_title("Copy of Legislators 2017")
# Get the first worksheet
worksheet = spreadsheet.worksheets.first

puts "Searched details"


last_name_to_search = "saravanan" 

# Fetch data based on the last name
matching_rows = worksheet.rows.select { |row| row[0] == last_name_to_search } # last name is in the first column (index 0)

# Print the matching rows
matching_rows.each do |row|
  puts "Last Name: #{row[0]}, First Name: #{row[1]},  Date of Birth: #{row[2]}, Gender: #{row[3]}"
end
