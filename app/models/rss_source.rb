class RssSource < ActiveRecord::Base
  validates :url, presence: true


  private
  before_create :set_title
  def set_title
    if rss = get_rss(url)
      feed = Feedjira::Feed.fetch_and_parse(rss)
    end
    self.title = feed.try(:title) || ""
  end

  def get_rss(url)
    rss = Feedbag.find(url) 
    if rss.empty? then nil else rss[0] end
  end
end
