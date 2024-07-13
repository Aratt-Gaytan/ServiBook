# app/services/weather_api.rb
require 'httparty'

class ServiBookMail
  include HTTParty
  base_uri 'https://standing-shiny-titanium.glitch.me'

  def  initialize

  end

  def send_invoice(body)
    options = {
      headers: { 'Content-Type' => 'application/json' },
      body: body.to_json
    }
    self.class.post("/invoice", options)

  end
end
