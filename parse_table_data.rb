#! /usr/bin/env ruby
=begin
Written by: sigu <sigu@sigumagwa.com>
github: github.com/sigu
twitter: @s_igu
stackoveflow: stackoverflow.com/users/4137155/sigu-magwa
=end
require 'nokogiri'
require 'open-uri'

#enter the valid web address to get the data from
doc = Nokogiri::HTML(open("http://localhost:8000"))
# initialise counter to show output
counter = 1
# open file for saving the output
file = File.new("output.csv", "w")
# with 3500 rows of data, loop through all the rows and save
1.upto(3500) do |row|
  110.times do |field|
    # select the data and save in an array
    doc.css("div#attrTableGrid-row-#{row} td.field#{field}").each do |link|
      #write the output content to the already open file
      file.write(link.content)
    end
    # comma seperate the values
    file.write(",")
  end
  # enter new line after every row
  file.write("\n")
  #show how many rows have been written to the file so far
  print counter
  counter = counter + 1
  print ','
end
# close the file safely once done
file.close
