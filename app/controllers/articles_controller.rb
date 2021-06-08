class ArticlesController < ApplicationController

    before_action :set_articles,only:[:show,:edit,:update,:destroy]

	def index
		@articles = Article.all
	end

	def show
	end

	def new
    @article = Article.new
  end

  def create
    	@article = Article.create(article_params)
      @article.user = User.first
         if @article.save
          flash[:notice] = "Article was save successfully"
    	       redirect_to article_path(@article)
           else
             render 'new'
          end
  end

    def edit
    end

    def update
    		@article.update(article_params)
          if @article.save
            flash[:notice] = "Article was successfully Updated"
    	      redirect_to article_path(@article)
          else
            render'edit'
          end

    end

      def destroy
        @article.destroy
        redirect_to articles_path
    end

    private

    def set_articles
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title,:description)
    end
end