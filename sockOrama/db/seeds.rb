# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "google_drive"

session = GoogleDrive::Session.from_config("config.json")


blend = session.spreadsheet_by_key("1m_x4ZtQzTHYldutf_i90uXSfKfEjFXSPvyV_L58nDJ0").worksheets[0]

(2..blend.num_rows).each do |row|

  blend[row, 5].split(",").collect(&:strip).each do |s|
    Size.create!(
      abbr:  s.match(/[A-Z]+/i)[0],
      in_stock: s.match(/\d+/)[0].to_i,
      sock:   Sock.where(name: blend[row, 1]).first_or_create!(
          name: blend[row, 1],
          color: Color.where(name: blend[row, 2]).first_or_create!,
          style: Style.where(name: blend[row, 3]).first_or_create!,
          category: Category.where(name: blend.title).first_or_create!,
          price: blend[row, 6].gsub(/\D+/, "").to_i * 100,
          description: blend[row, 8],
          remote_image_url: blend[row, 7]
          )
      )
end

end

llama = session.spreadsheet_by_key("1m_x4ZtQzTHYldutf_i90uXSfKfEjFXSPvyV_L58nDJ0").worksheets[1]

(2..llama.num_rows).each do |row|


  llama[row, 5].split(",").collect(&:strip).each do |s|
    Size.create!(
      abbr:  s.match(/[A-Z]+/i)[0],
      in_stock: s.match(/\d/)[0].to_i,
      sock:   Sock.where(name: llama[row, 1]).first_or_create!(
          name: llama[row, 1],
          color: Color.where(name: llama[row, 2]).first_or_create!,
          style: Style.where(name: llama[row, 3]).first_or_create!,
          category: Category.where(name: llama.title).first_or_create!,
          price: llama[row, 6].gsub(/\D+/, "").to_i * 100,
          description: llama[row, 9],
          remote_image_url: llama[row, 7]
          )
      )
  end

end

alpaca = session.spreadsheet_by_key("1m_x4ZtQzTHYldutf_i90uXSfKfEjFXSPvyV_L58nDJ0").worksheets[2]

(2..alpaca.num_rows).each do |row|

  alpaca[row, 5].split(",").collect(&:strip).each do |s|
    Size.create!(
      abbr:  s.match(/[A-Z]+/i)[0],
      in_stock: s.match(/\d/)[0].to_i,
      sock:   Sock.where(name: alpaca[row, 1]).first_or_create!(
          name: alpaca[row, 1],
          color: Color.where(name: alpaca[row, 2]).first_or_create!,
          style: Style.where(name: alpaca[row, 3]).first_or_create!,
          category: Category.where(name: alpaca.title).first_or_create!,
          price: alpaca[row, 6].gsub(/\D+/, "").to_i * 100,
          description: alpaca[row, 8],
          remote_image_url: alpaca[row, 7]
          )
      )
  end

end

wool = session.spreadsheet_by_key("1m_x4ZtQzTHYldutf_i90uXSfKfEjFXSPvyV_L58nDJ0").worksheets[3]

(2..wool.num_rows).each do |row|

  blend[row, 5].split(",").collect(&:strip).each do |s|
    Size.create!(
      abbr:  s.match(/[A-Z]+/i)[0],
      in_stock: s.match(/\d/)[0].to_i,
      sock:   Sock.where(name: wool[row, 1]).first_or_create!(
          name: wool[row, 1],
          color: Color.where(name: wool[row, 2]).first_or_create!,
          style: Style.where(name: wool[row, 3]).first_or_create!,
          category: Category.where(name: wool.title).first_or_create!,
          price: wool[row, 6].gsub(/\D+/, "").to_i * 100,
          description: wool[row, 8],
          remote_image_url: wool[row, 7]
          )
      )
  end

end
