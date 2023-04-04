require 'rails_helper'

RSpec.describe UsersController, type: :request do
  it 'should response /users' do
    get '/users'
    expect(response).to be_successful
  end

  it 'should render index template' do
    get '/users'
    expect(response).to render_template('index')
  end

  it 'should render show template' do
    get '/users/1'
    expect(response).to render_template('show')
  end

  it 'should content correct h1 in /users' do
    get '/users'
    expect(response.body).to include('Users index')
  end

  it 'should content correct h1 in /users/id' do
    get '/users/1'
    expect(response.body).to include('User show')
  end
end
