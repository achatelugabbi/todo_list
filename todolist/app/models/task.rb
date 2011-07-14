class Task < ActiveRecord::Base
  belongs_to :person
  validates_presence_of :name, :priority

  def self.find(*args)
     with_scope(:find => { :order =>  "finished ASC, priority ASC" }) do
   	 super(*args)
     end
  end

end
