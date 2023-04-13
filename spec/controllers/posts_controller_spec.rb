require 'rails_helper'

RSpec.describe PostsController, type: :request do
  it 'should response users/id/posts' do
    # get '/users/1/posts'
    # expect(response).to be_successful
  end

  it 'should render index template' do
    # get '/users/1/posts'
    # expect(response).to render_template('index')
  end

  it 'should render show template' do
    # get '/users/1/posts/1'
    # expect(response).to render_template('show')
  end
end
