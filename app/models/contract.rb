class Contract < ActiveRecord::Base
  belongs_to :job
  belongs_to :contractors
end
