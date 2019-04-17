class BlogsController < ApplicationController
    before_action :move_to_index, except: [:index , :show]
    before_action :comment_all, only: [:index, :show]
    before_action :comment_find_user, only: [:edit, :update, :destroy]

    def index
    end

    def new
    end

    def create
        Comment.create(title: comment_params[:title], text: comment_params[:text], user_id: current_user.id)
        redirect_to '/'
    end

    def edit
    end

    def update
        @comment.update(comment_params) if @comment.user_id == current_user.id
        redirect_to root_path
    end

    def destroy
        @comment.destroy if @comment.user_id == current_user.id
        redirect_to '/'
    end

    def show
    end



    private
    def comment_params
        params.require(comment).permit(:title,:text)
    end

    def move_to_index
        redirect_to action: :index unless user_signed_in?
    end

    def comment_all
        @comments = Comment.all
    end

    def comment_find_user
        @comment = Comment.find(params[:id])
    end

end
