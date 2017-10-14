class ApplicationCyclesController < ApplicationController

  def show
    @application_cycle = ApplicationCycle.includes(:school_applications).find(params[:id])
  end

  def create
    application_cycle = ApplicationCycle.new(application_params)
    privilege = ApplicationCyclePrivilege.new(
      user: current_user,
      application_cycle: application_cycle,
      privilege: ApplicationCyclePrivilege::PRIVILEGES[:owner]
    )

    ApplicationCycle.transaction do
      application_cycle.save
      privilege.save
    end
    redirect_to root_path
  end

  private

  def application_params
    params.require(:application_cycle).permit(:name, :year)
  end
end
