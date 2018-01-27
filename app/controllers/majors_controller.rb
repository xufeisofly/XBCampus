class MajorsController < ApplicationController
  def index
    majors = Major.all
    render_collection(majors)
  end
end
