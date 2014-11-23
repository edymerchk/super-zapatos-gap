class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  respond_to :html

 def index
    @articles = Article.includes(:store)
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was successfully created."
      redirect_to articles_path
    else
      respond_with(@article)
    end

  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated."
      redirect_to articles_path
    else
      respond_with(@article)
    end
  end

  def destroy
    @article.destroy
    flash[:notice] = "Article was successfully destroyed."
    respond_with(@article)
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:name, :description, :price, :total_in_vault, :total_in_shelf, :store_id)
    end
end
