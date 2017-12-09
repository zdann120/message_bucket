class Message < ApplicationRecord
  belongs_to :bucket
  has_secure_token

  enum priority: [:standard, :urgent, :warning]
end
