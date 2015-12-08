class ArticlesController < ApplicationController
    
    
    before_action :params_article, only: [:edit, :show, :update, :destroy]
    
    
   def index
       @articles = Article.all
   end
   
   def new
       @article = Article.new
       
   end
   
   def edit
       
   end
   
   
   
   def create
       
     @article = Article.new(article_params)  
     if @article.save
        flash[:notice]= "Article was created"
        redirect_to article_path(@article)
     else
         render 'new'
     end
   end
   
   
   def show
      
   end
   
   
   def destroy
      
      @article.destroy
      flash[:notice]= "Succefully deleted"
      redirect_to articles_path
      
   end
   
   def params_article
      
       @article = Article.find(params[:id]) 
   end
   
   
   def update
      if @article.update(article_params)
          flash[:notice] = "Article Updated"
          redirect_to article_path(@article)
      else
          render 'edit'
      end
          
   end
   private
    def article_params
      params.require(:article).permit(:title, :description)
      
    end
    
end