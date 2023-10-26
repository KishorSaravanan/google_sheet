require 'bundler'
Bundler.require

session = GoogleDrive::Session.from_service_account_key("client_secret.json")

spreadsheet = session.spreadsheet_by_title("Copy of Legislators 2017")

worksheet = spreadsheet.worksheets.first

worksheet.delete_rows(3,1)
worksheet.save

worksheet.rows.each {|row| puts row.first(6).join(" | ")}


