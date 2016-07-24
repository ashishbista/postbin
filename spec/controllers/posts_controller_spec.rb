require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  let(:attributes) do
    {
      foo: :bar 
    }
  end

  let(:post1) { Post.create(header: {bar: :foo}, body: attributes) }

  describe "GET #index" do
    it "assigns all posts as @posts" do
      post1
      get :index
      expect(assigns(:posts)).to eq [post1]
    end
  end

  describe "POST #create" do
    it "creates a new Post" do
      expect {
        post :create, params: attributes
      }.to change(Post, :count).by(1)
    end

    it "assigns a newly created post as @post" do
      post :create, params: attributes
      expect(assigns(:post)).to be_a(Post)
      expect(assigns(:post)).to be_persisted
    end

    it "redirects to the created post" do
      post :create, params: attributes
      expect(response).to redirect_to(Post.last)
    end
  end

  describe "DELETE #destroy" do
    before { post1 }
    it "destroys the requested post" do
      expect {
        delete :destroy, params: {id: post1.id}
      }.to change(Post, :count).by(-1)
    end

    it "redirects to the posts list" do
      delete :destroy, params: {id: post1.to_param}
      expect(response).to redirect_to(posts_url)
    end
  end

end
