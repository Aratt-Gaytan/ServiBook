# app/services/weather_api.rb
require 'httparty'

class ServiBookMail
  include HTTParty
  base_uri 'https://fern-picturesque-wildcat.glitch.me/'

  def  initialize

  end

  def send_invoice(body)
    options = {
      headers: { 'Content-Type' => 'application/json' },
      body: body.to_json
    }
    response = self.class.post("/invoice", options)
    return response





  end
end
