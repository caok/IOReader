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

class RssSource < ActiveRecord::Base
  validates :url, presence: true
  validate :url_should_valid 

  private
  before_save :set_title
  def set_title
    return unless errors.empty?
    if rss = get_rss
      feed = Feedjira::Feed.fetch_and_parse(rss)
    end
    self.title = feed.try(:title) || ""
  end

  def url_should_valid
    if url.present? and get_rss.nil?
      errors.add(:url, "#{url} is not a valid rss feed.")
    end
  end

  def get_rss
    rss = Feedbag.find(url)
    if rss.empty? then nil else rss[0] end
  end 
end
