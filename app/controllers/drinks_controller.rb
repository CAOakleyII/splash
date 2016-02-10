
class DrinksController < ApplicationController
include DrinksHelper
  def search

   selector  = { 'ingredients' => { '$all' => [] } }

    params[:ingredients].each do |ingredient|
        selector['ingredients']['$all'].push(".*#{ingredient}.*")
    end

    options = { query: { selector: JSON.generate(selector), limit: 0 } }
    drinks_response = DrinksHelper.search(options)

    drinks = []
    drinks_response.parsed_response.each do |drink|
      drink_model = Drink.find_or_initialize_by(drink)
      drink_model.save()
      drinks.push(drink_model)
    end
    p drinks.length
    @drinks = drinks

  end
  def show
    @drink = Drink.find(params[:id])
  end
end
