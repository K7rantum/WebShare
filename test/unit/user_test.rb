# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  username           :string(255)
#  email              :string(255)
#  firstName          :string(255)
#  lastName           :string(255)
#  password           :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  salt               :string(255)
#  encrypted_password :string(255)
#  password_digest    :string(255)
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
