require 'test_helper'

class RssSourcesControllerTest < ActionController::TestCase 
  fixtures :users, :rss_sources

  def setup 
    @xiongbo = users(:xiongbo)
    sign_in_as(@xiongbo)
  end

  test "new source" do 
    get :new
    assert_response :success
  end
end
