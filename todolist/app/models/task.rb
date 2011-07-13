class Task < ActiveRecord::Base
  belongs_to :person
  validates_presence_of :name, :priority
end
