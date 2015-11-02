# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.delete_all
Product.create!(
  title: 'Eminasin Tempranillo',
  description: 'A rich, clear, red with purple hues, this wine has aromas of summer fruits with hints of cherry and strawberry against an earthy background of licorice, coffee, vanilla and tobacco.',
  image_url: 'http://www.alcoholfree.co.uk/images/emina_red_thumb180.jpg',
  price: 6.99
)
Product.create!(
  title: 'Organic Cabernet Sauvignon',
  description: 'A new organic wine from Weinkonig. This is a dark, full-bodied red wine with a fruity bouquet of blackberry and very delicate oak note. Well balanced tannins provide drinking pleasure.',
  image_url: 'http://www.alcoholfree.co.uk/images/cab_sauv_bio_thumb180.jpg',
  price: 7.99
)
