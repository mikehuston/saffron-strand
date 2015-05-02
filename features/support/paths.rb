# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the home\s?page$/
      '/'

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))
    when /^the Breakfast Menu page/i 
      '/items/breakfast'

    when /^the Sign In page/i
      '/users/sign_in'

    when /^the Menu page/i
      '/menu'

    when /^the admin home page/i
      '/admin/welcome'

    when /^the Admin Items Index page/i
      '/admin/items'

    when /^the Admin New Item page/i
      '/admin/items/new'

    when /^the Admin Settings page/i
      '/admin/settings'

    when /^the details page for "(.*)"/i
      @item = Item.find_by_name($1)
      admin_item_path(@item)

    when /^the edit item page for "(.*)"/i
      @item = Item.find_by_name($1)
      edit_admin_item_path(@item)

    when /^the edit menu page for "(.*)"/i
      @menu = Menu.find_by_name($1)
      edit_admin_menu_path(@menu)

    when /^the New Event page/i
      '/events/new'

    when /^the sample menu page/i
      '/menus/sample_menus'

    when /^the New Sample Menu page/i
      '/admin/menus/new'

    when /^the Admin Sample Menus page/i
      '/admin/menus'

    when /^the admin settings add admin page/i
      '/users/non_admin'

    when /^the Custom Order page/i
      '/events/custom_order'

    when /^the Show Event page/i
      '/events/show'

    when /^the Saved Orders page/i
      '/events/view_saved'

    when /^the Admin Events page/i
      '/admin/events'

    when /^the confirmation page/i
      '/events/submit'

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
