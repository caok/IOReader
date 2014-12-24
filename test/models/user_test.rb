require 'test_helper'

class UserTest < ActiveSupport::TestCase 
  fixtures :users, :rss_sources, :entries, :notes

  def setup 
    @user = users(:xiongbo)
    @source = rss_sources(:xiongbo)
    @entry = entries(:one)
    @source_attributes = gen_attributes(@source)
    @entry_attributes = gen_attributes(@entry)
  end

  test "source relationship" do 
    assert_difference('@user.rss_sources.count', 1) do
      @user.rss_sources.create(@source_attributes)
    end
  end

  test "entry relationship" do 
    assert_difference('@user.entries.count', 1) do
      @user.entries.create(@entry_attributes)
    end
  end

  test "note relationship" do
    note = notes(:one)
    note.update(entry_id: @entry.id)
    note_attributes = gen_attributes(note)

    assert_difference('@user.notes.count', 1) do
      @user.notes.create(note_attributes)
    end
  end

  test "destroy all associated notes when destroy user" do
    note1 = notes(:one)
    note1.update(user_id: @user.id)
    note2 = notes(:two)
    note2.update(user_id: @user.id)

    assert_difference('Note.count', -2) do
      @user.destroy
    end
  end
end
