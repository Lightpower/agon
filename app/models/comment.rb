class Comment < ActiveRecord::Base
  belongs_to :jury
  belongs_to :presentation
end
