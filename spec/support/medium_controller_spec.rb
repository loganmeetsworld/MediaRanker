require 'spec_helper'

RSpec.shared_examples "medium controller" do
	let(:sing_name) { model.to_s.downcase}
	let(:plur_name) { sing_name + "s" }
	let(:media) { sing_name.to_sym }
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

	describe "PATCH 'update'" do
		before :each do 
			@media = model.create(name: "test")
		end

		context "selecting the edit button" do
			it "redirects to the individual show page" do
				patch :update, { id: @media.id }.merge(media_params)
				expect(subject).to redirect_to polymorphic_path(@media)
			end

			it "updates the record" do 
				patch :update, { id: @media.id }.merge(media_params)
				@media.reload
				expect(@media.name).to eq media_params[media][:name]
			end
		end
	end

	describe "DELETE 'destroy'" do
		before :each do 
			@media = model.create(name: "name")
		end

		context "selecting delete button" do
			it "redirects to the individual show page" do
				delete :destroy, id: @media.id
				expect(subject).to redirect_to polymorphic_path(plur_name)
			end

			it "should be able to delete media" do 
				expect { delete :destroy, { id: @media.id } }.to change(model, :count).by(-1)
			end
		end
	end

	describe "POST 'vote'" do 
		before :each do 
			@media = model.create(name: "name")
			request.env["HTTP_REFERER"] = polymorphic_path(@media)
		end

		context "selecting upvote button" do
			it "adds one to the rank" do 
				post :vote, id: @media.id
				@media.reload 
				expect(@media.rank).to eq 1
			end

			it "stays on the same page after vote" do
				post :vote, id: @media.id
				@media.reload
				expect(subject).to redirect_to polymorphic_path(@media)
			end
		end
	end

end