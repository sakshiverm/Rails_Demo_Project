class CommentsController < ApplicationController
    def new
        @comment=Comment.new
    end    
    def create
        @user=User.find(params[:user_id])
        @post=@user.posts.find(params[:post_id])
        @comment=@post.comments.create(comment_params)
        if @comment.save
            redirect_to post_path(@post)
        end
    end 
    private
        def comment_params
            params.require(:comment).permit(:author,:body)
        end
end
