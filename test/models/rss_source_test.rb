# == Schema Information
#
# Table name: rss_sources
#
#  id         :integer          not null, primary key
#  url        :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class RssSourceTest < ActiveSupport::TestCase 
  fixtures :rss_sources, :users

  def setup 
    @user = users(:xiongbo)
    @source = rss_sources(:xiongbo) 
    @source_attributes = gen_attributes(@source)
  end

  test "source presence" do 
    source = RssSource.new
    source.save
    assert source.errors.keys.include?(:url)
  end

  test "invalid rss source" do 
    invalid_url = "www.google.com"
    invalid_source = RssSource.new(url: invalid_url)
    invalid_source.save 

    assert invalid_source.errors.keys.include?(:url)
  end

  test "auto generate title for valid rss source" do 
    source = rss_sources(:xiongbo) 
    new_source = RssSource.new(url: source.url)
    new_source.save

    assert_equal source.title, new_source.title
  end

  test "get_rss with valid url" do 
    source = rss_sources(:xiongbo)
    assert source.send(:get_rss)
  end 

  test "get_rss with invalid url" do
    invalid_url = "www.google.com"
    invalid_source = RssSource.new(url: invalid_url)

    assert_nil invalid_source.send(:get_rss)
  end

  test "fetch entries after save" do 
    Entry.delete_all
    source = rss_sources(:xiongbo) 
    new_source = RssSource.new(url: source.url)
    new_source.save 

    assert_not_equal 0, Entry.count
  end

  test "has correct entries" do
    Entry.delete_all
    source = rss_sources(:xiongbo) 
    new_source = RssSource.new(url: source.url)
    new_source.save

    assert_equal new_source.entries, Entry.all
  end

  test "belongs to user" do 
    assert_difference '@source.users.count', 1 do 
      @source.update(user: @user)
    end
  end
end
