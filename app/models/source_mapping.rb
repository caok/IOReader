class SourceMapping < ActiveRecord::Base
  belongs_to :user
  belongs_to :rss_source
end
