class SchoolApplicationsController < ApplicationController

  def create
    puts = "params = #{params.to_json}"
    school_application = SchoolApplication.new(application_params)
    school_application.save

    redirect_to application_cycles_path(school_application.application_cycle_id)
  end

  private

  def application_params
    params.require(:school_application).permit(:application_cycle_id, :school_id)
  end
end
