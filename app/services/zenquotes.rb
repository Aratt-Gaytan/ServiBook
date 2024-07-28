class Zenquotes
  include HTTParty
  base_uri "https://zenquotes.io/api"

  def initialize
  end

  def self.get_quote
    options = {
      headers: { 'Content-Type' => 'application/json' }
    }
    # Use the base_uri when calling get
    response = get("/random", options)

    # Fix the typo: JSON.parse instead of JSON.PARSE
    JSON.parse(response.body)
  end
end
