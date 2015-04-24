require 'mandrill'

class EventsController < ApplicationController

  before_filter :authenticate_user!, only: [:show]

  helper_method :parse_selected, :save_items_session, :get_items_session_and_reset, :assign_user_event

  def create
    session[:budget_per_person] = params[:event].delete :budget_per_person
    session[:event] = params[:event]
    redirect_to events_custom_order_path
  end

  def save_order
    @items = parse_selected params[:items]
    if not user_signed_in?
      save_items_session
      redirect_to new_user_session_path and return
    end
    if not session[:items].nil?
      @items = get_items_session_and_reset
    end
    @menu = Menu.new budget_per_person: session[:budget_per_person].to_i
    @menu.items = Item.find(@items)
    if @menu.valid?
      @menu.save
      assign_user_event @menu
      redirect_to '/events/show' and return
    end
    flash[:message] = @menu.errors.messages[:base].first
    redirect_to '/events/custom_order'
  end

  def new
  end

  def submit
    @name = current_user.name
    mandrill = Mandrill::API.new env["MANDRILL_API_KEY"]
    message = {  
     :subject=> "Customer order",  
     :from_name=> "Saffron Strand",  
     :text=>"Hi message, how are you?",  
     :to=>[  
       {  
         :email=> "mhuston955@gmail.com",  
         :name=> "Recipient1"  
       }  
     ],    
     :from_email=>"sender@yourdomain.com"  
    }  
    sending = m.messages.send message  
  end

  def edit
  end

  def custom_order
    if flash[:message]
      flash.keep
    end
    if session[:event].nil? or session[:budget_per_person].nil?
      redirect_to '/events/new'
    end
    @budget_per_person = session[:budget_per_person].to_i
    @item_types = Menu.get_item_types @budget_per_person
    @item_counts = Menu.get_item_counts @budget_per_person
    @item_options = Menu.get_item_options @item_types

    # flash[:message] = nil
    # @event = current_user.event
    # @items_appetizers = Item.where(food_type: 'Appetizer')
    # @items_salb = Item.where(food_type: 'Salad/B')
    # @items_entrees = Item.where(food_type: 'Entree')
    # @items_meat = Item.where(food_type: 'Meat')
    # @items_veg = Item.where(food_type: 'Veg')
    # @items_sides = Item.where(food_type: 'Side')
    # @items_desserts = Item.where(food_type: 'Dessert')
    # @items_bev = Item.where(food_type: 'Beverage')
    # @appetizers = 0
    # @salb = 0
    # @entrees = 0
    # @meat = 0
    # @veg = 0
    # @sides = 0
    # @desserts = 0
    # @bev = 0
    # if @event.menu.budget_per_person == 7
    #   @appetizers = 6
    #   @meat = 2
    #   @veg = 4
    # end
    # if @event.menu.budget_per_person == 8
    #   @salb = 1
    #   @entrees = 2
    #   @veg = 1
    #   @meat = 1
    # end
    # if @event.menu.budget_per_person == 12
    #   @appetizers = 2
    #   @salb = 1
    #   @entrees = 3
    #   @meat = 1
    #   @veg = 1
    #   @sides = 2
    #   @desserts = 1
    #   @bev = 1
    # end
    # if @event.menu.budget_per_person == 15
    #   @appetizers = 3
    #   @salb = 1
    #   @entrees = 4
    #   @meat = 1
    #   @veg = 1
    #   @sides = 3
    #   @desserts = 2
    #   @bev = 1
    # end
    # if @event.menu.save
    #   if @event.menu.items.where(food_type: 'Appetizer').count != @appetizers
    #     flash[:message] = "Please select the correct number of Appetizers!"
    #   end
    #   if @event.menu.items.where(food_type: 'Entree').count != @entrees
    #     flash[:message] = "Please select the correct number of Entrees!"
    #   end
    #   if @event.menu.items.where(food_type: 'Meat').count != @meat
    #     flash[:message] = "Please select the correct number of Meats!"
    #   end
    #   if @event.menu.items.where(food_type: 'Veg').count != @veg
    #     flash[:message] = "Please select the correct number of Vegs!"
    #   end
    #   if @event.menu.items.where(food_type: 'Side').count != @sides
    #     flash[:message] = "Please select the correct number of Sides!"
    #   end
    #   if @event.menu.items.where(food_type: 'Dessert').count != @desserts
    #     flash[:message] = "Please select the correct number of Desserts!"
    #   end
    # end
  end

  def show
    # Should we change this logic? not restful
    @event = current_user.event
    if @event and @event.menu
      @menu = @event.menu
      @item_types = Menu.get_item_types @menu.budget_per_person
      @items_by_type = @menu.get_items_by_type
    end

    # @menu = current_user.event.menu
    # @event = current_user.event
    # if @event.menu.budget_per_person == 7
    #   @appetizers = 6
    #   @meat = 2
    #   @veg = 4
    # end
    # if @event.menu.budget_per_person == 8
    #   @salb = 1
    #   @entrees = 2
    #   @veg = 1
    #   @meat = 1
    # end
    # if @event.menu.budget_per_person == 12
    #   @appetizers = 2
    #   @salb = 1
    #   @entrees = 3
    #   @meat = 1
    #   @veg = 1
    #   @sides = 2
    #   @desserts = 1
    #   @bev = 1
    # end
    # if @event.menu.budget_per_person == 15
    #   @appetizers = 3
    #   @salb = 1
    #   @entrees = 4
    #   @meat = 1
    #   @veg = 1
    #   @sides = 3
    #   @desserts = 2
    #   @bev = 1
    # end
    # @items_appetizers = @menu.items.where(food_type: 'Appetizer')
    # @items_salb = @menu.items.where(food_type: 'Salad/B')
    # @items_entrees = @menu.items.where(food_type: 'Entree')
    # @items_meat = @menu.items.where(food_type: 'Meat')
    # @items_veg = @menu.items.where(food_type: 'Veg')
    # @items_sides = @menu.items.where(food_type: 'Side')
    # @items_desserts = @menu.items.where(food_type: 'Dessert')
    # @items_bev = @menu.items.where(food_type: 'Beverage')
  end

  def view_saved
    if current_user.event
      @event = current_user.event
    else
      redirect_to events_custom_order_path
    end
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

  private

  def parse_selected selected
    items = selected.nil? ? {} : selected
    items.select {|k,v| v == '1'}.map {|k,v| k}
  end

  def save_items_session
    session[:items] = @items
    session[:user_return_to] = '/events/save_order'
  end

  def get_items_session_and_reset
    items = session[:items]
    session.delete :items
    if not session[:user_return_to].nil?
      session.delete :user_return_to
    end
    items
  end

  def assign_user_event menu
    current_user.destroy_current_event
    event = Event.create session[:event]
    event.menu = menu
    current_user.event = event
  end

end
