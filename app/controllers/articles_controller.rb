class ArticlesController < ApplicationController
	before_action :set_article, only: [:show, :edit, :update, :destroy]
  def index
  	@articles = Article.all
  end

  def show
  end

  def new
  	@article = Article.new
  end

  def create
  	@article = Article.new(article_params)
  	if @article.save
  		flash[:success] = "Article was successfully created!"
  		redirect_to @article 
  	else
  		# flash[:error] = "There was an error saving your article. Please try again."
  		render :new
  	end
  end

  def edit
  end

  def update
  	if @article.update_attributes(article_params)
  		flash[:success] = "Article was successfully updated!"
  		redirect_to @article 
  	else
  		# flash[:error] = "There was an error updating your article. Please try again."
  		render :edit
  	end
  end

  def destroy
		@article.destroy
  	flash[:danger] = "Article was deleted!"
  	redirect_to articles_path
  end

  private
  def article_params
  	params.require(:article).permit(:title, :body)
  end

  def set_article
  	@article = Article.find(params[:id])
  end

end


