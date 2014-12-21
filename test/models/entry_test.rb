# == Schema Information
#
# Table name: entries
#
#  id            :integer          not null, primary key
#  title         :string
#  summary       :text
#  published     :datetime
#  url           :string
#  entry_id      :string
#  categories    :string
#  rss_source_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class EntryTest < ActiveSupport::TestCase
  fixtures :entries, :rss_sources, :users

  def setup
    @user = users(:xiongbo)
    @entry = entries(:one)
    @user_attributes = gen_attributes(@user)
  end

  test "user relationship" do 
    assert_difference '@entry.users.count', 1 do
      @entry.users.create(@user_attributes.merge!(email: "test@gmail.com")) 
    end
  end
end
