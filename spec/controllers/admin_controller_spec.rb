require 'spec_helper'

describe AdminController do

  describe "GET 'process'" do
    it "returns http success" do
      get 'process'
      response.should be_success
    end
  end

end
