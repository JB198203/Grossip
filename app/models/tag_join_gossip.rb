class TagJoinGossip < ApplicationRecord
  belongs_to :tag, optional: true,  dependent: :destroy
  belongs_to :gossip, optional: true,  dependent: :destroy
end
