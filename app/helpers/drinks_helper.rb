require 'httparty'
module DrinksHelper

  def self.search(options)
    p options
    return HTTParty.get('http://104.236.235.221/6543/drinks', options);
  end
end
