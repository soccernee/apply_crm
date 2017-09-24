class HomeController < ApplicationController
  def index
    @application_cycle_objects = current_user.owned_applications.map do |app_cycle|
      {
        name: app_cycle.name,
        year: app_cycle.year,
        school_applications_count: app_cycle.school_applications.count,
        privilege: ApplicationCyclePrivilege::PRIVILEGES[:owner]
      }
    end

    app_cycle_edits = current_user.edit_applications.map do |app_cycle|
      {
        name: app_cycle.name,
        year: app_cycle.year,
        school_applications_count: app_cycle.school_applications.count,
        privilege: ApplicationCyclePrivilege::PRIVILEGES[:edit]
      }
    end
    @application_cycle_objects.concat(app_cycle_edits)
    puts "application_cycle_objects = #{@application_cycle_objects.to_json}"
  end
end
