require 'rails_helper'

RSpec.describe ExpensesController, type: :controller do
  let(:user) { User.create(name: 'Admin', email: 'admin@admin.com', password: '123456') }
  let(:expense) do
    Expense.create(
      author_id: user.id,
      name: 'Carrot Soup',
      amount: 100
    )
  end

  describe 'POST #create' do
    let(:user) { User.create(name: 'Shahadat Hossain', email: 'test@example.com', password: '12345678') }
    let(:category) { Category.create(name: 'Food', icon: 'home.svg', user_id: user.id)}

    context 'when user is logged in with valid params' do
      let(:valid_params) do
        { expense: { author_id: user.id, name: 'Tomato soup', amount: 15, category_id: category.id } }
      end

      before do
        user.confirm
        sign_in user
      end

      it 'creates a new expense' do
        expect do
          post :create, params: valid_params
        end.to change(Expense, :count).by(1)
      end
    end

    context 'when user is logged in with invalid params' do
      let(:category) { Category.create(name: 'Food', icon: 'home.svg', user_id: user.id) }
      let(:invalid_params) do
        { expense: { author_id: user.id, amount: 15, category_id: category.id } }
      end

      before do
        user.confirm
        sign_in user
      end

      it 'does not create a new expense' do
        expect do
          post :create, params: invalid_params
        end.not_to change(Expense, :count)
      end

      it 'renders the new template' do
        post :create, params: invalid_params

        expect(response).to render_template(:new)
      end
    end

    context 'when user is not logged in' do
      it 'redirects to the login page' do
        post :create, params: { expense: { name: 'Test Expense' } }

        expect(response).to redirect_to(splashscreen_path)
        expect(response).to have_http_status(:redirect)
      end

      it 'does not create a new recipe' do
        expect do
          post :create, params: { expense: { name: 'Test expense' } }
        end.not_to change(Expense, :count)
      end
    end
  end
end
