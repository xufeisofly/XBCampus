class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private

  def render_resource(resource, serialized_data = {}, options = {})
    serialized_data = {
      json: ActiveModelSerializers::SerializableResource.new(resource, options).serializable_hash
    }

    render serialized_data
  end

  def render_collection(collection, serialized_data = {}, options = {})
    render_resource(collection, serialized_data, options)
  end
end
