class ArticlesController < ApplicationController

  def index
    @category = Category.find(params[:category_id])
    @articles = @category.articles.all
  end

  def new
    @category = Category.find(params[:category_id])
    @article = @category.articles.new

  end

  def create
    @category = Category.find(params[:category_id])
    @article = @category.articles.new(article_params)

      if @article.save
        redirect_to category_articles_path(@category.id)
      else
        render "new"
      end
  end

  private
  def article_params
    params.require(:article).permit(:title, :content)
  end


end
