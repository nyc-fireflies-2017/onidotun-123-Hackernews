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

def show
  @category = Category.find(params[:category_id])
  @article = @category.articles.find(params[:id])
end


def edit
  @category = Category.find(params[:category_id])
  @article = Article.find(params[:id])
end

def update
  @article = Article.find(params[:id])
  @article.update_attributes(article_params)
  redirect_to category_articles_path
end

def destroy
  @article = Article.find(params[:id])
  @article.destroy
  redirect_to category_articles_path
end

  private
  def article_params
    params.require(:article).permit(:title, :content)
  end


end
