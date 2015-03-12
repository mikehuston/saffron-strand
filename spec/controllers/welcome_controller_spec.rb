require 'spec_helper'
describe WelcomeController do	
	describe 'index' do
		it '' do
			# fake_user =	double("User", :admin => true)
			# allow(controller).to receive(:current_user) { fake_user })
			get :index
			response.should redirect_to("http://test.host/users/sign_in")			
		end
	end
end