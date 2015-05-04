class Menu < ActiveRecord::Base
  attr_accessible :name, :budget_per_person, :sample
  # has_one :event
  has_and_belongs_to_many :items
  has_one :event
  has_one :menu_structure

  validate :item_counts

  def self.sample_menus
    Menu.all.select { |m| m.is_sample_menu? }.to_a
  end

  def is_sample_menu?
    sample
  end

  def set_items item_ids
    new_items = []
    item_ids.each do |id|
      new_items << Item.find(id)
    end
    items = new_items
  end

  def get_items_by_type
    items_by_type = {}
    item_types = menu_structure.get_item_types
    item_types.each do |type|
      items_by_type[type] = items.where food_type: type
    end
    items_by_type
  end

  private

  # Only want to run validation for custom_menu menus
  def item_counts
    if not sample
      correct_item_counts = menu_structure.get_item_counts
      actual_item_counts = Hash.new 0
      items.each {|item| actual_item_counts[item.food_type] += 1}
      correct_item_counts.each do |name, count|
        if actual_item_counts[name] != count
          errors.add(:base, "Please select #{count} #{name}s")
        end
      end
    end
  end

end
