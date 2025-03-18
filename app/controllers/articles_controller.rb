class ArticlesController < ApplicationController
    def index
        @articles = Article.all # fetch all articles from the database and assign to @articles variable.
    end
   # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
   def show
    @article = Article.find(params[:id]) # article/1 , :id `params[:id]` # @ to make it instance to access in the template
   end
end
