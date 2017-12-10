require "csv"

school_data = []
CSV.foreach("lib/assets/NishantUniversities.csv") do |row|
  school_data << row
end

if School.count > 0
  puts "The table already has school data, exiting..."
  return
end

puts "starting to create the data"

school_data.each do |data|
  School.create(name: data[0], city: data[1], state: data[2], country: 'US')
end

puts "Done, created #{School.count} schools"
