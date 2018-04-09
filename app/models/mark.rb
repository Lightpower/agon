class Mark < ActiveRecord::Base
  belongs_to :presentation
  belongs_to :jury
end
