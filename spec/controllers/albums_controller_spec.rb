RSpec.describe AlbumsController, type: :controller do
  it_behaves_like "media controller"
  let(:model) { Album }
end