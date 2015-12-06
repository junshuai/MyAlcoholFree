namespace :supply do
  desc "Update products from suppliers"
  task update: :environment do
    require 'net/http'

    suppliers = {'apple'  => 'http://boiling-lake-3463.herokuapp.com',
                 'banana' => 'http://salty-wave-4297.herokuapp.com'}

    first = true
    suppliers.each do |supplier_name, supplier_url|
      url = URI.parse(supplier_url + '/wines')
      req = Net::HTTP::Get.new(url.to_s)
      res = Net::HTTP.start(url.host, url.port) { |http|
        http.request(req)
      }
      json_string = res.body
      begin
        objs = ActiveSupport::JSON.decode(json_string)
        objs.each do |obj|
          product = Product.where(title: obj['title']).first_or_create
          price = obj['price'][1..-1].to_f
          if first || !product.price || price < product.price
            product.update!(
              description: obj['brief_description'],
              thumbnail_url: obj['thumbnail_url'],
              price: price,
              supplier: supplier_name
            )

            ProductDetail.where(product_id: product.id).first_or_create.update!(
              image_url: obj['image_url'],
              long_description: obj['long_description'],
              manufacturer: obj['manufacturer'],
              country_of_origin: obj['country_of_origin'],
              volume_in_liter: obj['volume_in_liter'].to_f,
              alcohol_by_volume: obj['alcohol_by_volume'].to_f,
              calories_in_kcal_per_100ml: obj['calories_in_kcal_per_100ml'].to_f,
              grape_type: obj['grape_type']
            )
          end
        end
      rescue ActiveSupport::JSON.parse_error
        Rails.logger.warn("Attempted to decode invalid JSON: #{json_string}")
      end
      first = false
    end
  end
end
