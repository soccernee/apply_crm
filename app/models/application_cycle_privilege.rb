class ApplicationCyclePrivilege < ApplicationRecord
  belongs_to :user
  belongs_to :application_cycle

  PRIVILEGES = {
    owner: 0,
    edit: 1,
    read: 2
  }.freeze

  PRIVILEGE_ENUMS = PRIVILEGES.values.freeze
  PRIVILEGE_STRINGS = PRIVILEGES.keys.freeze

  PRIVILEGE_STRINGS = PRIVILEGES.invert.freeze

  def self.privilege_to_s(privilege)
    PRIVILEGE_STRINGS[privilege].to_s
  end

end
