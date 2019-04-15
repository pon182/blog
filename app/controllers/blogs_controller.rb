class BlogsController < ApplicationController
    before_action :move_to_index, except: [:index , :show]

    def index
        @comments = Comment.all
    end

    def new
    end

    def create
        Comment.create(title: comment_params[:title],image: comment_params[:image], text: comment_params[:text], user_id: current_user.id)
        redirect_to '/'
    end

    def edit
        @comment = Comment.find(params[:id])
    end

    def update
        comment = Comment.find(params[:id])
        comment.update(comment_params) if comment.user_id == current_user.id
        redirect_to root_path
    end

    def destroy
        comment = Comment.find(params[:id])
        comment.destroy if comment.user_id == current_user.id
        redirect_to '/'
    end

    def show

        @comments = Comment.all
    end

    
    
    private
    def comment_params
        params.permit(:title,:image,:text)
    end

    def move_to_index
        redirect_to action: :index unless user_signed_in?
      end

end
