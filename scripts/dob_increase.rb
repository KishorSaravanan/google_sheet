require 'bundler'
Bundler.require

require 'date'

session = GoogleDrive::Session.from_service_account_key("client_secret.json")

spreadsheet = session.spreadsheet_by_title("Copy of Legislators 2017")


worksheet = spreadsheet.worksheets[0]

row_number = worksheet.rows.find_index { |row| row[1] == "Geetha" } + 1

puts row_number

if row_number
  # Get the original date of birth from the spreadsheet
  original_dob_string = worksheet[row_number, 3] # Assuming date of birth is in the third column (index 2)
  #date_new = original_dob_string.to_date
  #puts "orginal dob"
  #puts original_dob_string
  #puts original_dob_string.class
  
  

  begin
    original_date_of_birth = Date.parse(original_dob_string)
    puts original_date_of_birth
    # Calculate the new date of birth (increased by 120 days)
    new_date_of_birth = original_date_of_birth + 1

    # Update the date of birth in the spreadsheet
    worksheet[row_number, 3] = new_date_of_birth.strftime("%d/%m/%Y")

    # Save the changes to the spreadsheet
    worksheet.save

    puts "Date of birth for 'Geetha' increased to #{new_date_of_birth.strftime("%d/%m/%Y")}"
  rescue ArgumentError => e
    puts "Error: Invalid date format in the spreadsheet for 'Geetha'"
    puts "Details: #{e.message}"
  end
else
  puts "Name 'Saravanan' not found in the spreadsheet"
end
