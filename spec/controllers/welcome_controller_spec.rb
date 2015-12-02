RSpec.describe WelcomeController, type: :controller do
	describe "GET 'index'" do 
		it "returns 200 status" do 
			get :index
			expect(response.status).to eq(200)
		end
	end
end
