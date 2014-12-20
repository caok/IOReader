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
  has_many :entries
  has_many :source_mappings
  has_many :users, through: :source_mappings

  validates :url, presence: true
  validate :url_should_valid 

  private
  before_save :set_title
  def set_title
    return unless errors.empty?
    if rss = get_rss
      feed = Feedjira::Feed.fetch_and_parse(rss) 
      set_entries(feed) if feed.entries.present?
    end
    self.title = feed.try(:title) || ""
  end

  def set_entries(feed)
    feed.entries.each do |entry| 
      entries.new(
        title: entry.title,
        summary: entry.summary,
        published: entry.published,
        url: entry.url,
        entry_id: entry.entry_id,
        categories: entry.categories.join(",")
      )
    end
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
