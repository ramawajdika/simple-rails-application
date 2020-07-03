class CommentsController < ApplicationController
  http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy
  before_action :set_article
  def create
    # @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)   
  end
  def destroy
    # @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end
private

  def set_article
    @article = Article.find(params[:article_id])
  end
  def comment_params
    params.require(:comment).permit(:commenter, :boy)
  end
end