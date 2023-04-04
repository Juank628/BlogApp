require 'rails_helper'

RSpec.describe PostsController, type: :request do
  it 'should response users/id/posts' do
    get '/users/1/posts'
    expect(response).to be_successful
  end

  it 'should render index template' do
    get '/users/1/posts'
    expect(response).to render_template('index')
  end

  it 'should render show template' do
    get '/users/1/posts/22'
    expect(response).to render_template('show')
  end

  it 'should content correct h1 in users/id/posts' do
    get '/users/1/posts'
    expect(response.body).to include('Posts index')
  end

  it 'should content correct h1 in /users/user_id/posts/id' do
    get '/users/1/posts/22'
    expect(response.body).to include('Post show')
  end
end
