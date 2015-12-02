require 'spec_helper'

RSpec.shared_examples "medium controller" do
	let(:name_string) { model.to_s.downcase}
	let(:plur_name) { name_string + "s" }
	let(:media) { name_string.to_sym }
  let(:media_params) { { media => { name: "name" } } }
  let(:bad_params) { { media => {} } }

	describe "GET 'index'" do 
		it "returns 200 status" do 
			get :index
			expect(response).to be_success
			expect(response.status).to eq 200
			expect(response).to have_http_status 200
		end
	end

	describe "GET 'show'" do
		let(:something) do
      model.create(name: "test")
    end

    it "renders the show view" do
      get :show, id: something.id
      expect(subject).to render_template :show
    end
	end

	describe "GET 'new'" do 
		context "valid params" do 
			it "renders new view" do
      	get :new
      	expect(subject).to render_template :new
    	end

			it "creates a new instance of the media" do 
				get :new, media_params
				expect(assigns(media)).to be_kind_of(model)
			end
		end
	end

	describe "POST 'create'" do 
		context "valid params" do
			it "creates a record" do
        post :create, media_params
        expect(model.count).to eq 1
      end

			it "redirects to the index page" do 
				post :create, media_params
    		expect(subject).to redirect_to polymorphic_path(plur_name)
    	end
		end

		context "invalid params" do 
			it "renders new template on error" do 
				post :create, bad_params
      	expect(subject).to render_template :new
      end
		end
	end

	describe "GET 'edit'" do
		context "valid params" do 
		end

		context "invalid params" do 
		end
	end

	describe "PATCH 'update'" do
		context "valid params" do 
		end

		context "invalid params" do 
		end
	end

	describe "DELETE 'destroy'" do
		context "selecting delete button"
	end

	describe "POST 'vote'" do 
		context "selecting upvote button" do 
		end
	end

end