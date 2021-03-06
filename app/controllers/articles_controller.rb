class ArticlesController < ApplicationController
 def index
   @articles = Article.all
 end

 def show
   @article = Article.find(params[:id])
   @comment = Comment.new
   @comment.article_id = @article.id
 end

def new 
  @article = Article.new
end

def edit
  @article = Article.find(params[:id])
end

def update
  @article = Article.new(params[:article])
  @article.update_attributes(params[:article])
  flash.notice = "Article '#{@article.title}' Updated!"
  redirect_to article_path(@article)
end

def create
  @article = Article.new(params[:article])
  @article.save
  redirect_to article_path(@article)
end

def destroy 
  @article = Article.find(params[:id])
  @article.destroy
  redirect_to url_for( :action => "index")
end



end
