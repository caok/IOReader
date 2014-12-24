# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  email              :string           not null
#  encrypted_password :string(128)      not null
#  confirmation_token :string(128)
#  remember_token     :string(128)      not null
#

class User < ActiveRecord::Base
  include Clearance::User

  has_many :source_mappings
  has_many :entry_mappings
  has_many :rss_sources, through: :source_mappings
  has_many :entries, through: :entry_mappings
  has_many :notes, dependent: :destroy
end
