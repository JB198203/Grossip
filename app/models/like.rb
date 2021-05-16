class Like < ApplicationRecord
  belongs_to :user,  optional: true
  validates_uniqueness_of :gossip_id, scope: [:user_id, :gossip_id]
end
