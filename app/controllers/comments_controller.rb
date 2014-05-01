class CommentsController < ApplicationController
	before_filter :require_login, except: [:create]

	def create
		@comment = Comment.new(comment_params)
	  	@comment.article_id = params[:article_id]

	  	@comment.save

	  	redirect_to article_path(@comment.article)
	end

	def destroy
		@article = Comment.find(params[:id]).article
		Comment.destroy(params[:id])

		 flash.notice = "Comment removed!"

		 redirect_to article_path(@article)
	end

	def comment_params
		params.require(:comment).permit(:author_name, :body)
	end

end
