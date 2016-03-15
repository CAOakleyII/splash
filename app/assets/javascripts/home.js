// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready(function() {
  var ingredients = [];
  $.get('http://104.236.235.221:6543/drinks?limit=0',function(data){

    var parseIngredients = function(obj)  {
      for(var i = 0; i < obj.ingredients.length; i++) {
        var ingredient = obj.ingredients[i];
        var regex = /([0-9]+.*(oz|cup|shot|can|tbsp|splash|bottle|package|tsp|wedge|wedges|part|scoops|parts|dashes|pinch|fresh|baked|slice|\s+))|(fill with|squeeze of|top with)/;
        var name = ingredient.replace(regex,"").trim().toLowerCase();
        if(ingredients.indexOf(name) < 0) {
          ingredients.push(name);
        }
      }
    }

    var parseDrinks = function(obj){
      for (var i =0; i < obj.length; i++) {
        var drink = obj[i];
        parseIngredients(drink);
      }
    }
    parseDrinks(data);
    loadTypeahead();
  });

  var loadTypeahead = function() {
    var ingredientsEngine = new Bloodhound({
      datumTokenizer: Bloodhound.tokenizers.whitespace,
      queryTokenizer: Bloodhound.tokenizers.whitespace,
      local: ingredients
    });

    ingredientsEngine.initialize();

    $('#ingredient').typeahead({
      hint: true,
      highlight: true,
      minLength: 1},
      {
        name: 'ingredients',
        source: ingredientsEngine
      });
    };

    $('.add-ingredients').on('click', function(){
      var ingredient = Chip($('#ingredient').val());
      $('.ingredient-list').append(ingredient);

      $('.close-chip').on('click', function(event){
        $(event.target.parentElement).remove();
      });
    })
  });

  function Chip(value) {
    var chip = '<div class="chip">'
    chip += value + '<i class="material-icons close-chip">close</i>';
    chip += '<input type="hidden" name="ingredients[]" value="' + value + '">';
    chip += '</div>';
    return chip;
  }
