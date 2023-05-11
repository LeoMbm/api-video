class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    render json: @articles
  end

  def show
    @article = Article.find(params[:id])
    render json: @article
  end

  def create

    @article = Article.new(article_params)

    if @article.save
      render json: @article
    else
      render json: { error: 'Unable to create Article.' }
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      render json: @article
    else
      render json: { error: 'Unable to update Article.' }
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    render json: { message: 'Article successfully deleted.' }
  end
  
end
