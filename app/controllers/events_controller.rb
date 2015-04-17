class EventsController < ApplicationController

  before_filter :authenticate_user!

  def create
  	budget_per_person = params[:event].delete :budget_per_person
    if not current_user.event.nil?
      current_user.event.destroy
    end
  	@event = Event.new(params[:event])
  	if @event.valid?
      @event.save
      @event.create_menu name: 'Default Name', budget_per_person: budget_per_person
      current_user.event = @event
      redirect_to '/events/custom_order'
  	end
  end

  def new
  end

  def submit
    @name = current_user.name
  end

  def edit
  end

  def custom_order
    flash[:message] = nil
  	@event = current_user.event
    @items_appetizers = Item.where(food_type: 'Appetizer')
    @items_salb = Item.where(food_type: 'Salad/B')
    @items_entrees = Item.where(food_type: 'Entree')
    @items_meat = Item.where(food_type: 'Meat')
    @items_veg = Item.where(food_type: 'Veg')
    @items_sides = Item.where(food_type: 'Side')
    @items_desserts = Item.where(food_type: 'Dessert')
    @items_bev = Item.where(food_type: 'Beverage')
    @appetizers = 0
    @salb = 0
    @entrees = 0
    @meat = 0
    @veg = 0
    @sides = 0
    @desserts = 0
    @bev = 0
    if @event.menu.budget_per_person == 7
      @appetizers = 6
      @meat = 2
      @veg = 4
    end
    if @event.menu.budget_per_person == 8
      @salb = 1
      @entrees = 2
      @veg = 1
      @meat = 1
    end
    if @event.menu.budget_per_person == 12
      @appetizers = 2
      @salb = 1
      @entrees = 3
      @meat = 1
      @veg = 1
      @sides = 2
      @desserts = 1
      @bev = 1
    end
    if @event.menu.budget_per_person == 15
      @appetizers = 3
      @salb = 1
      @entrees = 4
      @meat = 1
      @veg = 1
      @sides = 3
      @desserts = 2
      @bev = 1
    end
    if @event.menu.save
      if @event.menu.items.where(food_type: 'Appetizer').count != @appetizers
        flash[:message] = "Please select the correct number of Appetizers!"
      end
      if @event.menu.items.where(food_type: 'Entree').count != @entrees
        flash[:message] = "Please select the correct number of Entrees!"
      end
      if @event.menu.items.where(food_type: 'Meat').count != @meat
        flash[:message] = "Please select the correct number of Meats!"
      end
      if @event.menu.items.where(food_type: 'Veg').count != @veg
        flash[:message] = "Please select the correct number of Vegs!"
      end
      if @event.menu.items.where(food_type: 'Side').count != @sides
        flash[:message] = "Please select the correct number of Sides!"
      end
      if @event.menu.items.where(food_type: 'Dessert').count != @desserts
        flash[:message] = "Please select the correct number of Desserts!"
      end
    end
  end

  def show
    @menu = current_user.event.menu
    @event = current_user.event
    if @event.menu.budget_per_person == 7
      @appetizers = 6
      @meat = 2
      @veg = 4
    end
    if @event.menu.budget_per_person == 8
      @salb = 1
      @entrees = 2
      @veg = 1
      @meat = 1
    end
    if @event.menu.budget_per_person == 12
      @appetizers = 2
      @salb = 1
      @entrees = 3
      @meat = 1
      @veg = 1
      @sides = 2
      @desserts = 1
      @bev = 1
    end
    if @event.menu.budget_per_person == 15
      @appetizers = 3
      @salb = 1
      @entrees = 4
      @meat = 1
      @veg = 1
      @sides = 3
      @desserts = 2
      @bev = 1
    end
    @items_appetizers = @menu.items.where(food_type: 'Appetizer')
    @items_salb = @menu.items.where(food_type: 'Salad/B')
    @items_entrees = @menu.items.where(food_type: 'Entree')
    @items_meat = @menu.items.where(food_type: 'Meat')
    @items_veg = @menu.items.where(food_type: 'Veg')
    @items_sides = @menu.items.where(food_type: 'Side')
    @items_desserts = @menu.items.where(food_type: 'Dessert')
    @items_bev = @menu.items.where(food_type: 'Beverage')
  end


  def update
    @menu = current_user.event.menu
    items = params[:items].select {|k,v| v == '1'}.map {|k,v| k}
    @menu.items = Item.find(items)
    @menu.update_attributes!(params[:menu])
    if flash[:message].nil?
      redirect_to '/events/show'
    else
      redirect_to events_custom_order_path
    end
  end

end
