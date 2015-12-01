require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  it_behaves_like "medium controller"
  let(:model) { Book }
end