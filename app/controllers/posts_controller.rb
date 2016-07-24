class PostsController < ApplicationController
  before_action :set_post, only: [:destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(header: post_headers.to_h, body: post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.except(:controller, :action)
    end

    def post_headers
      request.headers.select { |k,v| k.downcase.starts_with?('http') }
    end

end
