class SharedUser < ApplicationRecord
  # Active Record Associations
  belongs_to :user, foreign_key: 'user_id', class_name: 'User'
  belongs_to :i_share_with, foreign_key: 'i_share_with_id', class_name: 'User'

  # Active Record Validations
  validates :i_share_with_id, uniqueness: { scope: :user_id }
end
