class Drink < ActiveRecord::Base
  serialize :ingredients,Array
end
