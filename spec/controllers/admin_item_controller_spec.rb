require 'spec_helper'
describe Admin::ItemsController do
	 	before(:each) do
 		allow_message_expectations_on_nil
		user = double('user')
    user.stub(:admin?) { true }
		allow(request.env['warden']).to receive(:authenticate!) { user }
    allow(request.env['warden']).to receive(:authenticate!) { user }
		allow(controller).to receive(:current_user) { user }
  end

  describe 'index' do
  	it '' do
			Item.should_receive(:where)
			post :index  		
  	end
  end
  describe 'create' do
  	it '' do
  		fake_item = double("Item", :name => 'test')
			Item.stub(:create!) { fake_item }
			post :create
			expect(response).to redirect_to(admin_items_path)
  	end
  end
  describe 'edit' do
  	it '' do
			fake_item = double('Item')
			Item.should_receive(:find).with('1').and_return(fake_item)
			get :edit, {:id => '1'}
			response.should be_success  		
  	end
  end
  describe 'update' do
  	it '' do
			fake_item = double('Item')
			fake_item.stub(:update_attributes!)
			fake_item.stub(:name)
			mock2 = double('Item')
			Item.should_receive(:find).with('1').and_return(fake_item)
			fake_item.should_receive(:update_attributes!)
			post :update, {:id => '1', :item => mock2 }
			response.should redirect_to(admin_items_path)
  	end
  end
  describe 'destroy' do
  	it '' do
			fake_item = double('Item')
			fake_item.stub(:name)
			Item.should_receive(:find).with('1').and_return(fake_item)
			fake_item.should_receive(:destroy)
			post :destroy, {:id => '1'}
			response.should redirect_to(admin_items_path)
  	end
  end
  describe 'show' do
  	it '' do
  		fake_item = double('Item')
  		Item.stub(:find){ fake_item }
  		Item.should_receive(:find).with('1')
			get :show, {:id => 1}
			expect(response).to render_template('show')
  	end
  end
  describe 'new' do
  	it '' do
  		
  	end
  end
end