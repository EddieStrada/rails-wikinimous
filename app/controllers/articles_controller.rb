class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    # for the form
    @article = Article.new
  end

  def create # never has a view!
    # save to DB
    @article = Article.new(article_params) # strong params!
    if @article.save
      redirect_to article_path(@article)
    else
      # redirect_to new_restaurant_path
      render :new # new.html.erb
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to article_path(@article)
    else
      render :edit # edit.html.erb
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  # STRONG PARAMS -> whitelisting attributes
  def article_params
    # params[:restaurant] -> permit name, address, raint
    params.require(:article).permit(:title, :content)
  end
end
