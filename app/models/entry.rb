# == Schema Information
#
# Table name: entries
#
#  id            :integer          not null, primary key
#  title         :string
#  summary       :text
#  published     :datetime
#  url           :string
#  entry_id      :string
#  categories    :string
#  rss_source_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Entry < ActiveRecord::Base

end
