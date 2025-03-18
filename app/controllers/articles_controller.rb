class ArticlesController < ApplicationController
    def index
        @articles = Article.all # fetch all articles from the database and assign to @articles variable.
    end
   # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
   def show
    @article = Article.find(params[:id]) # article/1 , :id `params[:id]` # @ to make it instance to access in the template
   end

   def create
     #  @article = Article.new(params[:article]) it will not work , give forbiden error message

     @article = Article.new(params.require(:article).permit(:title, :description))
    if @article.save

        flash[:notice] = "Article created successfully"
     #  redirect_to article_path(@article.id)
     redirect_to @article
    else
     puts @article.errors.full_messages
      render "new", status: :unprocessable_entity # unprocessable_entity its force -render to show the error message
    end
   end

   def new
     @article = Article.new
   end
end
