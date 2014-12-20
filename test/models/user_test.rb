require 'test_helper'

class UserTest < ActiveSupport::TestCase 
  fixtures :users, :rss_sources 

  test "source relationship" do 
    user = users(:xiongbo)
    source = rss_sources(:xiongbo)
    user.rss_sources.create(source.attributes)

    assert_equal [source], user.rss_sources
  end
end
