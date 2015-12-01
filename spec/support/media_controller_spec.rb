require 'spec_helper'

RSpec.shared_examples "media controller" do
	let(:media) { described_class }

	describe "GET 'index'" do 
		it "returns 200 status" do 
			get :index
			expect(response.status).to eq(200)
		end
	end
end