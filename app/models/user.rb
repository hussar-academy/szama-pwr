class User < ActiveRecord::Base
  has_many :payments, foreign_key: "creator_id"
end
