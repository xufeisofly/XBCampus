class CompaniesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index

  end

  def new

  end

  def create
    binding.pry
    @company = Company.new(company_params)
    if @company.save
      render json: @company
    else
      render :new
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  def show

  end

  private

  def company_params
    params.require(:company).permit(:username, :password, :password_confirmation, :contact_person, :phone, :email)
  end
end
