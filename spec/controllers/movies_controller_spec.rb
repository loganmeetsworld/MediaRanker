RSpec.describe MoviesController, type: :controller do
  it_behaves_like "media controller"
  let(:model) { Movie }
end