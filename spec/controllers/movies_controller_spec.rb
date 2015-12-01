require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  it_behaves_like "medium controller"
  let(:model) { Movie }
end