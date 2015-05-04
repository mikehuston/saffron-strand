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
    @menu.menu_structure = MenuStructure.find_menu_struct session
    @menu.items = Item.find(@items)
    if @menu.valid?
      @menu.save
      assign_user_event @menu
      redirect_to '/events/show' and return
    end
    flash[:danger] = @menu.errors.messages[:base].first
    redirect_to '/events/custom_order'
  end

  def new
  end

  def submit
    @name = current_user.name
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
    menu_struct = MenuStructure.find_menu_struct session
    @item_types = menu_struct.get_item_types
    @item_counts = menu_struct.get_item_counts
    @item_options = menu_struct.get_item_options  
  end

  def show
    @event = current_user.event
    if @event and @event.menu
      @menu = @event.menu
      menu_struct = @menu.menu_structure
      @item_types = menu_struct.get_item_types
      @items_by_type = @menu.get_items_by_type
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_view_saved_path
  end

  def view_saved
    @event = current_user.event ? current_user.event : Event.null_event
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
