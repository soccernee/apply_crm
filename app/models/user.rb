class User < ApplicationRecord
  # Include default devise modules. Others available are: :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         # :confirmable

  has_many :application_cycle_privileges

  has_many :owned_applications,
    -> { where('application_cycle_privileges.privilege' => ApplicationCyclePrivilege::PRIVILEGES[:owner]) },
    source: :application_cycle,
    through: :application_cycle_privileges

  has_many :edit_applications,
    -> { where('application_cycle_privileges.privilege' => ApplicationCyclePrivilege::PRIVILEGES[:edit]) },
    source: :application_cycle,
    through: :application_cycle_privileges

  has_many :read_applications,
    -> { where('application_cycle_privileges.privilege' => ApplicationCyclePrivilege::PRIVILEGES[:read]) },
    source: :application_cycle,
    through: :application_cycle_privileges

end
