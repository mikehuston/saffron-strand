class Menu < ActiveRecord::Base
  attr_accessible :name, :budget_per_person
  # has_one :event
  has_and_belongs_to_many :items
  has_one :event

  validate :item_counts

  def self.sample_menus
  	# TODO: FIX THIS ONCE ADMIN IMPLEMENTED
  	Menu.all.select {|m| true}.to_a
  end

  def set_items item_ids
  	new_items = []
  	item_ids.each do |id|
  	  new_items << Item.find(id)
  	end
  	items = new_items
  end

  def self.get_item_counts budget_per_person
    item_counts = {}
    case budget_per_person
    when 7
      item_counts['Appetizer'] = 6
    when 8
      item_counts['Entree'] = 2
    when 12
      item_counts['Appetizer'] = 2
      item_counts['Entree'] = 3
      item_counts['Side'] = 2
      item_counts['Dessert'] = 1
    when 15
      item_counts['Appetizer'] = 3
      item_counts['Entree'] = 4
      item_counts['Side'] = 3
      item_counts['Dessert'] = 2     
    end
    item_counts
  end

  private

  def item_counts
    correct_item_counts = Menu.get_item_counts budget_per_person
    actual_item_counts = {}
    items.each {|item| item_counts[item.food_type] += 1}
    correct_item_counts.each do |name, count|
      if actual_item_counts[name] != count
        errors.add(:base, "Please select #{count} #{name}s")
      end
    end
  end

end
