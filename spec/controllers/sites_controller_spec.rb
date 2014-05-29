require 'spec_helper'

describe SitesController do

  #method defined in controller_macros.rb to create a logged in user before running below tests
  login_user

  describe 'GET index' do
    it 'returns a 200 OK status' do
      get :index
      expect(response.status).to eq(200)
    end
  end

  it 'renders the index template' do
    get :index
    expect(response).to render_template('index')
  end

  describe 'GET about' do
    it 'returns a 200 OK status' do
      get :about
      expect(response.status).to eq(200)
    end
  end

  it 'renders the about template' do
    get :about
    expect(response).to render_template('about')
  end

  describe 'GET contact' do
    it 'returns a 200 OK status' do
      get :contact
      expect(response.status).to eq(200)
    end
  end

  it 'renders the about template' do
    get :contact
    expect(response).to render_template('contact')
  end

end


  