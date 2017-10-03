class UsersController < ApplicationController
  before_action :signed_in_student, only: [:index, :edit, :update]
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
      UserMailer.confirmation_email(@user).deliver_later
      flash[:success] = "Please confirm you email address to continue"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      student_signed_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def confirmation_email
    user = User.find_by_confirm_token(params[:id])
    if user
      user.email_activate
      flash[:success] = "Your email has been confirmed."
      redirect_to studentsignin_path
    else
      flash[:error] = "sorry. User does not exist"
      redirect_to root_path
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
