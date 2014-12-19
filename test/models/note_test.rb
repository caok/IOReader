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

  test "entry_id presence" do
    invalid_note = notes(:one)
    invalid_note.entry_id = nil
    invalid_note.save

    assert invalid_note.errors.keys.include?(:entry_id)
  end

  test "user_id presence" do
    invalid_note = notes(:one)
    invalid_note.user_id = nil
    invalid_note.save

    assert invalid_note.errors.keys.include?(:user_id)
  end

  test "abstract presence" do
    invalid_note = notes(:one)
    invalid_note.abstract = nil
    invalid_note.save

    assert invalid_note.errors.keys.include?(:abstract)
  end

  test "position presence" do
    invalid_note = notes(:one)
    invalid_note.position = nil
    invalid_note.save

    assert invalid_note.errors.keys.include?(:position)
  end

  test "default color is yellow" do
    note = notes(:one)
    note.color = nil
    note.save

    assert note.yellow?
  end
end
