require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'GET #show' do
    let(:user) { User.create(first_name: 'John') }
    subject { get :show, id: id }

    context 'with valid user id' do
      let(:id) { user.id }

      # kiedy wymagany jest before subject, a kiedy nie
      it 'assigns @user' do
        subject

        expect(assigns(:user)).to eq(user)
      end
    end

    context 'with invalid user id' do
      let(:id) { 'abc' }

      # raise error
      it 'raises exception' do
        expect { subject }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe 'GET #index' do
    let(:user) { User.create(first_name: 'John') }

    # dobre miejsce do powiedzenia o subjectach
    subject { get :index }

    it 'assigns @users' do
      subject

      expect(assigns(:users)).to eq([user])
    end
  end

  describe 'POST #create' do
    #kiedy w subject mozna pisac paramsy, a kiedy lepiej przeniesc je do osobnego let
    subject { post :create, params }

    context 'with valid params' do
      # jak mozna inaczej zapisac params
      let(:params) {{ user: { first_name: 'John' }}}

      # jedno i kilku linijkowy it
      it 'creates new user' do
        expect { subject }.to change { User.count }.by(1)
      end

      # is_expected.to = expect { subject }.to
      it 'redirects to users_path' do
        is_expected.to redirect_to(users_path)
      end
    end

    context 'with invalid params' do
      let(:params) {{ user: { last_name: 'test' }}}

      it 'does not create new user' do
        expect { subject }.to_not change { User.count }
      end
    end
  end

  describe 'PUT #update' do
    subject { put :update, params }
    let(:user) { User.create(first_name: 'John') }

    context 'with valid params' do
      let(:params) {{ id: user.id, user: { first_name: 'Doe' }}}

      it 'changes user first names' do
        expect { subject }.to change { user.reload.first_name }.from('John').to('Doe')
      end

      it 'redirect to users path' do
        is_expected.to redirect_to(users_path)
      end
    end

    context 'with invalid params' do

    end
  end

  describe 'DELETE #destroy' do
    subject { delete :destroy, id: id }

    context 'with valid user id' do
      # let vs let!
      let!(:user) { User.create(first_name: 'John') }
      let(:id) { user.id }

      it 'deletes user' do
        expect { subject }.to change { User.count }.by(-1)
      end

      it 'redirects to users path' do
        expect(subject).to redirect_to(users_path)
      end
    end

    context 'with invalid user id' do
      let(:id) { 'abc' }

      # raise error
      it 'raises exception' do
        expect { subject }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
