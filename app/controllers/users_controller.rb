class UsersController < ApplicationController
  before_action :signed_in_student, only: [:edit, :update]
  before_action :correct_user,      only: [:edit, :update]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      student_signed_in @user #signed in after sign up
      flash[:success] = "Welcome!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      student_signed_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def user_params
    params.require(:user).permit(:name, 
                                 :email, 
                                 :password, 
                                 :password_confirmation)
  end

  private
  
    def signed_in_student
      redirect_to studentsignin_path, notice: "Please sign in." unless student_signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_student?(@user)
    end

end
