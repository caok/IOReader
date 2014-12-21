require 'test_helper'

class UserTest < ActiveSupport::TestCase 
  fixtures :users, :rss_sources, :entries

  def setup 
    @user = users(:xiongbo)
    @source = rss_sources(:xiongbo)
    @entry = entries(:one)
    @source_attributes = gen_attributes(@source)
    @entry_attributes = gen_attributes(@entry)
  end

  test "source relationship" do 
    assert_difference('@user.rss_sources.count', 1) do
      @user.rss_sources.create(@source_attributes)
    end
  end

  test "entry relationship" do 
    assert_difference('@user.entries.count', 1) do
      @user.entries.create(@entry_attributes)
    end
  end
end
