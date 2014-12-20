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

require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  fixtures :notes

  %w(entry_id user_id abstract position).each do |item|
    test "#{item} presence" do
      invalid_note = notes(:one)
      invalid_note.send("#{item}=", nil)
      invalid_note.save

      assert invalid_note.errors.keys.include?(item.to_sym)
    end
  end

  test "default color is yellow" do
    note = notes(:one)
    note.color = nil
    note.save

    assert note.yellow?
  end
end
