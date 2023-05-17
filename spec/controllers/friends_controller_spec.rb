# frozen_string_literal: true

describe FriendsController, type: :controller do
  describe 'GET #index' do
    before { get :index }

    it { is_expected.to respond_with(200) }
    it { is_expected.to render_template('index') }
  end

  describe 'GET #show' do
    let(:friend) { create(:friend) }

    before { get :show, params: { id: friend.id } }

    it { is_expected.to respond_with(:ok) }
    it { is_expected.to render_template('show') }
  end

  describe 'GET #new' do
    before { get :new }

    it { is_expected.to respond_with(:ok) }
    it { is_expected.to render_template('new') }
  end

  describe 'GET #edit' do
    let(:friend) { create(:friend) }

    before { get :edit, params: { id: friend.id } }

    it { is_expected.to respond_with(:ok) }
    it { is_expected.to render_template('edit') }
  end

  describe 'POST #create' do
    let(:friend) { build(:friend) }

    subject(:create_request) { post :create, params: { friend: friend.attributes } }

    it do
      create_request
      expect(response).to have_http_status(:found)
      #is_expected.to respond_with(:found)
    end

    it do
      create_request
      is_expected.to redirect_to(friend_path(Friend.last))
    end

    it { expect { create_request }.to change(Friend, :count).by(1) }
  end

  describe 'PUT #update' do
    let(:friend) { create(:friend) }
    let(:new_attributes) { attributes_for(:friend) }

    subject(:update_request) { put :update, params: { id: friend.id, friend: new_attributes } }

    it do
      update_request
      expect(response).to have_http_status(302)
      #is_expected.to respond_with(302)
    end

    it do
      update_request
      is_expected.to redirect_to(friend_path(friend))
    end

    it { expect { update_request }.to change { friend.reload.name }.to(new_attributes[:name]) }
  end

  describe 'DELETE #destroy' do
    let!(:friend) { create(:friend) }

    subject(:destroy_request) { delete :destroy, params: { id: friend.id} }

    it do
      destroy_request
      expect(response).to have_http_status(302)
    end

    it do
      destroy_request
      is_expected.to redirect_to(friends_path)
    end

    it { expect { destroy_request }.to change(Friend, :count).by(-1) }
  end

  describe 'GET #childhood' do
    before { get :childhood }

    it { is_expected.to respond_with(:ok) }
    it { is_expected.to render_template('childhood') }
  end

  describe 'GET #work' do
    before { get :work }

    it { is_expected.to respond_with(:ok) }
    it { is_expected.to render_template('work') }
  end

  describe 'GET #college' do
    before { get :college }

    it { is_expected.to respond_with(:ok) }
    it { is_expected.to render_template('college') }
  end

  describe 'GET #school' do
    before { get :school }

    it { is_expected.to respond_with(:ok) }
    it { is_expected.to render_template('school') }
  end
end
