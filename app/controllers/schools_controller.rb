class SchoolsController < ApplicationController

  # GET
  def search
    search_results = School.search_by_name(params[:name])
    render json: search_results
  end
end
