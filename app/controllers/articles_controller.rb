class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new
    @article.title = params[:title]
    @article.description = params[:description]
    @article.save
    redirect_to article_path(@article)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    edit_title = params[:article][:title]
    edit_description = params[:article][:description]
    # @article.update(title: edit_title, description: edit_description)
      if @article.title != edit_title
        @article.update(title: edit_title)
      end
      if @article.description != edit_description
        @article.update(description: edit_description)
      end
    redirect_to article_path(@article)
  end

end
