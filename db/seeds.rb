# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.delete_all

Product.create!(
  title: 'Romance en Rouge Organic Red',
  description: 'A premium-quality organic de-alcoholised red wine. A rich bouquet with fine aromas of blackcurrant and delicate herbs.',
  image_url: 'http://www.alcoholfree.co.uk/images/romance_en_rouge_4_thumb180.jpg',
  price: 7.99
)

Product.create!(
  title: 'Weinkonig Scheurebe',
  description: 'Fruity and crisp with a wonderful aroma. A citrus tang gives it a zing on the tongue.',
  image_url: 'http://www.alcoholfree.co.uk/images/scheurebe_thumb180.jpg',
  price: 7.29
)

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

Product.create!(
  title: 'Eminasin Verdejo',
  description: 'Due in week starting 9th November. Spanish white wine at its very best. This 100% Verdejo grape varietal perfectly compliments salads, fish and seafood dishes and should ideally be served at 4 to 7C.',
  image_url: 'http://www.alcoholfree.co.uk/images/emina_white_thumb180.jpg',
  price: 6.99
)
