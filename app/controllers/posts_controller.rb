class PostsController < ApplicationController
  # This helper finds the specific post before running show, edit, update, or destroy
  before_action :set_post, only: %i[ show edit update destroy ]

  # GET /posts
  def index
    @posts = Post.all
  end

  # GET /posts/1
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: "Post was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Post was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  # def destroy
  #   @post.destroy
  #   redirect_to posts_url, notice: "Post was successfully destroyed.", status: :see_other
  # end

  def destroy
  @post.destroy
  # redirect_to tells the browser to make a NEW request to index
  redirect_to posts_path, notice: "Deleted!", status: :see_other
end

def secret_api_check
  # head builds a header-only response (no body/HTML)
  if params[:token] == "123"
    head :ok
  else
    head :unauthorized
  end
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # ONLY allow the specific columns we want (Strong Parameters)
    # We use :context here because that is what you named your database column!
    def post_params
      params.require(:post).permit(:title, :context, :published)
    end
end