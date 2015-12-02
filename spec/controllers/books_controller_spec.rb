RSpec.describe BooksController, type: :controller do
  it_behaves_like "media controller"
  let(:model) { Book }
end