require 'spec_helper'

RSpec.shared_examples "media controller" do
	let(:media) { described_class }

	describe "GET 'index'" do 
		it "returns 200 status" do 
			get :index
			expect(response.status).to eq(200)
		end
	end

	describe "GET 'show'" do 
		let(:album || :book || :movie) do 
			Album.create(name: "something")
			Book.create(name: "something")
			Movie.create(name: "something")
		end

		it "renders the show view" do 
			get :show, id: album.id || book.id || movie.id
			expect(subject).to render_template :show
		end
	end

	describe "GET 'new'" do 
		let(:params) do 
			{
				media: {
					name: "something"
				}
			}
		end

		it "returns the new template" do 
			get :new, params
			expect(subject).to render_template :new
		end
	end

	describe "POST 'create'" do 
		let(:params) do 
			{
				media: {
					name: "something"
				}
			}
		end

		let(:bad_params) do 
			{
				media: {}
			}
		end

		it "redirects to index page" do 
			post :create, params
			expect(subject).to redirect_to media
		end

		it "renders the new page on bad params" do
			post :create, bad_params
			expect(subject).to render_template :new
		end
	end
end