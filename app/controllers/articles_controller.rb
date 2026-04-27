# app/controllers/articles_controller.rb
class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to new_article_path, notice: "Article was successfully created!"
    else
      # This allows the form to show errors once we add validations
      render :new, status: :unprocessable_entity
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :slug, :slug_confirmation, :status, :confirm_rights)
  end
end