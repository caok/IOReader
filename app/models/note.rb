# == Schema Information
#
# Table name: notes
#
#  id         :integer          not null, primary key
#  entry_id   :integer
#  user_id    :integer
#  abstract   :text
#  comment    :text
#  position   :string
#  color      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Note < ActiveRecord::Base
  enum color: { yellow: 0, blue: 1, green: 2, red: 3, purple: 4 }

  belongs_to :entry
  belongs_to :user

  validates :entry_id, :user_id, :abstract, :position, presence: true

  private
  before_save :set_color
  def set_color
    return if color.present?
    self.color = "yellow"
  end
end
