# frozen_string_literal: true

# == Schema Information
#
# Table name: shared_users
#
#  id              :bigint           not null, primary key
#  user_id         :bigint
#  i_share_with_id :bigint
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class SharedUser < ApplicationRecord
  # Active Record Associations
  belongs_to :user, class_name: 'User'
  belongs_to :i_share_with, class_name: 'User'

  # Active Record Validations
  validates :i_share_with_id, uniqueness: { scope: :user_id }
end
