class UsersController < ApplicationController
  def index
    @users=User.all
  end
  def show
    @user=User.find_by(id: params[:id])
    if @user.nil?
      @users=User.all
      flash.now[:alert]="user was not found"
      render :index
    end
  end
  def new
    @user=User.new
  end 
  def create
    @user=User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render :new, status: :unprocessable_entity
    end
  end 
  def edit
    @user=User.find(params[:id])
  end
  def update
    @user=User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit, status: :unprocessable_entity 
    end
  end 
  def destroy
    @user=User.find(params[:id])
    @user.destroy
    redirect_to root_path

  end    
  private
    def user_params
      params.require(:user).permit(:email,:password,:first_name,:last_name)
    end
end
