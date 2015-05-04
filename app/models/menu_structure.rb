class MenuStructure < ActiveRecord::Base
  attr_accessible :event_type, :budget_per_person, :num_appetizers, :num_sides, :num_entrees, :num_desserts

  def get_item_types
    item_types = []
    if num_appetizers > 0
      item_types << "Appetizer"
    end
    if num_sides > 0
      item_types << "Side"
    end
    if num_desserts > 0
      item_types << "Dessert"
    end
    if num_entrees > 0
      item_types << "Entree"
    end
    item_types

  end

  def get_item_options
    item_types = get_item_types
    item_options = {}
    item_types.each do |type|
      items = Item.where(food_type: type)
      # categories = items.categories.where name: event_type
      items = items.select |item| do
        categories = item.categories
        categories.include? event_type
      end
      item_options[type] = items
    end
    item_options
  end

  def get_item_counts 
    item_types = {}
    if num_appetizers > 0
      item_types["Appetizer"] = num_appetizers
    end
    if num_sides > 0
      item_types["Entree"] = num_entrees
    end
    if num_desserts > 0
      item_types["Side"] = num_sides
    end
    if num_entrees > 0
      item_types["Dessert"] = num_desserts
    end
    item_types
  end
end
