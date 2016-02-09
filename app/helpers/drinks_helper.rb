module DrinksHelper
  include HTTParty
  base_uri '104.236.235.221:6543'

  def search(query)
    self.class.get('/drinks', query: options)
  end
end
