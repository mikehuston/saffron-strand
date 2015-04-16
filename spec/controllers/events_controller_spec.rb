require 'spec_helper'

describe EventsController do

  describe "GET 'submit'" do
    it "returns http success" do
      get 'submit'
      response.should be_success
    end
  end

end
