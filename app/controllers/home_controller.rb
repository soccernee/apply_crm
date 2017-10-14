class HomeController < ApplicationController
  def index
    @application_cycle_objects = current_user.owned_applications.map do |app_cycle|
      app_cycle_object(app_cycle, ApplicationCyclePrivilege::PRIVILEGES[:owner])
    end

    app_cycle_edits = current_user.edit_applications.map do |app_cycle|
      app_cycle_object(app_cycle, ApplicationCyclePrivilege::PRIVILEGES[:edit])
    end

    app_cycle_reads = current_user.read_applications.map do |app_cycle|
      app_cycle_object(app_cycle, ApplicationCyclePrivilege::PRIVILEGES[:read])
    end

    @application_cycle_objects.concat(app_cycle_edits).concat(app_cycle_reads)
    puts "application_cycle_objects = #{@application_cycle_objects.to_json}"
  end

  private

  def app_cycle_object(app_cycle, privilege)
    {
      id: app_cycle.id,
      name: app_cycle.name,
      year: app_cycle.year,
      school_applications_count: app_cycle.school_applications.count,
      privilege: privilege
    }
  end
end
