require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:user) { User.create(name: 'Admin', email: 'admin@admin.com', password: '123456') }
  let(:category) do
    Category.create(
      name: 'Home',
      icon: 'home'
    )
  end

  describe 'POST #create' do
    let(:user) { User.create(name: 'Shahadat Hossain', email: 'test@example.com', password: '12345678') }

    context 'when user is logged in with valid params' do
      let(:valid_params) do
        { category: { name: 'Office', icon: 'home' } }
      end

      before do
        user.confirm
        sign_in user
      end
    end

    context 'when user is logged in with invalid params' do
      let(:invalid_params) do
        { category: { name: nil, icon: 'home' } }
      end

      before do
        user.confirm
        sign_in user
      end

      it 'does not create a new category' do
        expect do
          post :create, params: invalid_params
        end.not_to change(Category, :count)
      end

      it 'renders the new template' do
        post :create, params: invalid_params

        expect(response).to render_template(:new)
      end
    end

    context 'when user is not logged in' do
      it 'redirects to the splashscreen' do
        post :create, params: { category: { name: 'Test Category' } }

        expect(response).to redirect_to(splashscreen_path)
        expect(response).to have_http_status(:redirect)
      end

      it 'does not create a new category' do
        expect do
          post :create, params: { category: { name: 'Test Category' } }
        end.not_to change(Category, :count)
      end
    end
  end
end
