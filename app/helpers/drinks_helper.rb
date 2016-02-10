require 'httparty'
module DrinksHelper

  def self.search(options)
    p options
    return HTTParty.get('http://localhost:6543/drinks', options);
  end
end
