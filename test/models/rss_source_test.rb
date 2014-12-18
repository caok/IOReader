require 'test_helper'

class RssSourceTest < ActiveSupport::TestCase 
  fixtures :rss_sources
  test "source presence" do 
    source = RssSource.new
    source.save
    assert source.errors.keys.include?(:url)
  end

  test "auto generate title for source" do 
    source = rss_sources(:xiongbo) 
    new_source = RssSource.new(url: source.url)
    new_source.save

    assert_equal source.title, new_source.title
  end
end
