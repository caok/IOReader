require 'test_helper'

class RssSourcesControllerTest < ActionController::TestCase 
  fixtures :users, :rss_sources

  def setup 
    @xiongbo = users(:xiongbo)
    sign_in_as(@xiongbo)

    @source = rss_sources(:xiongbo)
    @source_attr = gen_attributes(@source)
  end

  test "source list" do 
    get :index
    assert_response :success
    assert_not_nil assigns(:rss_sources)

    assert_equal @xiongbo.rss_sources, assigns(:rss_sources)
  end 

  test "create list" do 
    @request.headers["Accepts"] = "text/json"
    assert_difference '@xiongbo.rss_sources.count' do
      post :create, rss_source: @source_attr
    end

    response = JSON.parse @response.body, symbolize_names: true
    assert_equal true, response.has_key?(:title)
  end

end
