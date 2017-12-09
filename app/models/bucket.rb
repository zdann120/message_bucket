class Bucket < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy
  has_secure_token
  before_create :set_access_code

  def to_param
    token
  end

  def set_access_code
    self.access_code = loop do
      rand_code = ULID.generate
      break rand_code unless Bucket.exists?(access_code: rand_code)
    end
  end
end
