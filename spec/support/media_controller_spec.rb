require 'spec_helper'
require 'pry'

RSpec.shared_examples "media controller" do |subject_class|
	describe "GET 'index" do 
		before :each do 
			get :index, type: model.type
		end

		it "returns the index page" do
      expect(subject).to render_template :index
    end

    it "returns 200 status" do
    	expect(response.status).to eq 200 
    end
	end

	describe "GET 'show'" do
		before :each do 
			get :show, type: subject_class.to_s, id: model.id
		end

    it "returns the show page" do
      expect(subject).to render_template :show
    end

    it "returns 200 status" do
    	expect(response.status).to eq 200 
    end
	end

	describe "GET 'new'" do 
		before :each do 
			get :new, type: subject_class.to_s, id: model.id
		end

		context "selecting the new button" do 
	    it "returns 200 status" do
	    	expect(response.status).to eq 200 
	    end

	    it "renders the new page" do
      	expect(subject).to render_template :new
    	end
		end
	end

	describe "GET 'edit'" do 
		before :each do 
			get :edit, type: subject_class.to_s, id: model.id
		end

		context "selecting the edit button" do 
	    it "returns 200 status" do
	    	expect(response.status).to eq 200 
	    end

	    it "renders the edit page" do
      	expect(subject).to render_template :edit
    	end
		end
	end

	describe "POST 'create'" do 
		context "valid params" do
			it "redirects to show page after succesfully creating new" do
      	post :create, create_params
      	expect(subject).to redirect_to polymorphic_path(Medium.all.last)
    	end

   		it "creates a Media record" do
        post :create, good_params
        expect(model).to be_an_instance_of model.class
      end
    end

    context "invalid params" do
    	it "renders new template on error" do
      	post :create, bad_params.merge({type: subject_class.to_s})
      	expect(subject).to render_template :new
    	end
    end
	end

	describe "PATCH 'update'" do
		context "selecting submit button on edit" do
			it "redirects to show page after successful edit" do
	      patch :update, good_params.merge({id: model.id, type: subject_class.to_s})
	      expect(subject).to redirect_to polymorphic_path(subject_class.last)
	    end
	  end
	end

	describe "DELETE 'destroy'" do
		context "selecting delete button" do
			it "redirects to the individual show page" do
				delete :destroy, good_params.merge({id: model.id, type: subject_class.to_s})
      	expect(response.status).to eq 302
			end

			it "actually deletes the thing" do 
				@media = Medium.find(model.id)
				expect { delete :destroy, { id: @media.id } }.to change(Medium.all, :count).by(-1)
			end
		end
	end

	describe "POST 'vote'" do 
		before :each do 
			request.env["HTTP_REFERER"] = "back_path"
			@new_model_rank = model.rank += 1
		end

		context "selecting upvote button" do
			it "adds one to the rank" do 
				post :vote, type: model.type, id: model.id
				model.reload
				expect(model.rank).to eq @new_model_rank
			end

			it "stays on the same page after vote" do
				expect(response.status).to eq 200 
			end
		end
	end
end