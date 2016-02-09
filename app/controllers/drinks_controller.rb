
class DrinksController < ApplicationController
include DrinksHelper
  def search
    drinks = new DrinksHelper
    p drinks.search()
    p params[:ingredients]
    #make an api call for drinks that include provided ingredients.
    #return that resource to
  end
  def show
  end
end
