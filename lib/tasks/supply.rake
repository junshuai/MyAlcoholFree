namespace :supply do
  desc "Update products from suppliers"
  task update: :environment do
    require 'net/http'
    url = URI.parse('http://evening-wave-3166.herokuapp.com/wines')
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) { |http|
      http.request(req)
    }
    json_string = res.body

    begin
      objs = ActiveSupport::JSON.decode(json_string)
      objs.each do |obj|
        product = Product.where(title: obj['title']).first_or_create
        product.update!(
          description: obj['brief_description'],
          image_url: obj['thumbnail_url'],
          price: obj['price'].to_f
        )

        ProductDetail.where(product_id: product.id).first_or_create.update!(
          long_description: obj['long_description'],
          manufacturer: obj['manufacturer'],
          country_of_origin: obj['country_of_origin'],
          volume_in_liter: obj['volume_in_liter'].to_f,
          alcohol_by_volume: obj['alcohol_by_volume'].to_f,
          calories_in_kcal_per_100ml: obj['calories_in_kcal_per_100ml'].to_f,
          grape_type: obj['grape_type']
        )
      end
    rescue ActiveSupport::JSON.parse_error
        Rails.logger.warn("Attempted to decode invalid JSON: #{json_string}")
    end
  end

end
