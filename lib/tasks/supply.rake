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
        Product.where(title: obj['title']).first_or_create.update(
          description: obj['brief_description'],
          image_url: obj['thumbnail_url'],
          price: obj['price']
        )
      end
    rescue ActiveSupport::JSON.parse_error
        Rails.logger.warn("Attempted to decode invalid JSON: #{some_string}")
    end
  end

end
