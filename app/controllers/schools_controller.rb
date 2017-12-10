class SchoolsController < ApplicationController
  respond_to :json

  # GET
  def search
    search_results = School.search_by_name(params[:name])
    puts "search_results = #{search_results.to_json}"
    render json: { resources: search_results, total: search_results.count }
  end
end
