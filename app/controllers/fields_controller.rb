class FieldsController < ApplicationController
  def index
    fields = Fields.all
    render json: {

    }
  end
end
