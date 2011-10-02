# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# We'll import the data from the sql file previously generated.
# Ugly, but more convenient than reencoding everything in Ruby
ActiveRecord::Base.connection.execute 'DELETE FROM countries;'
source = File.new("db/sql/countries.sql", "r")
while (line = source.gets)
  ActiveRecord::Base.connection.execute line
  # We can get away with line-by-line execution because each INSERT is on a single line
end
source.close

