require 'spec_helper'
describe ItemsController do
 	before(:each) do
 		allow_message_expectations_on_nil
		user = double('user')
		allow(request.env['warden']).to receive(:authenticate!) { user }
		allow(controller).to receive(:current_user) { user }
  end

	describe 'index' do
		it 'should call model method to get all items' do
			Item.should_receive(:all)
			get :index
		end
	end
	describe 'breakfast' do
		it 'should call model method to get all breakfast' do
			Item.should_receive(:where).with(category: 'Breakfast')
			get :breakfast
		end
	end
	describe 'lunch' do
		it 'should call model method to get all lunch' do
			Item.should_receive(:where)
			get :lunch
		end
	end
	describe 'dinner' do
		it 'should call model method to get all dinner' do
			Item.should_receive(:where)
			get :dinner
		end
	end
	
end