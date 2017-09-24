class ApplicationCyclePrivilege < ApplicationRecord
  belongs_to :user
  belongs_to :application_cycle

  PRIVILEGES = {
    owner: 0,
    edit: 1,
    read: 2
  }.freeze

  PRIVILEGE_ENUMS = PRIVILEGES.values
  PRIVILEGE_STRINGS = PRIVILEGES.keys
end