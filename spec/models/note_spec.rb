require 'rails_helper'

RSpec.describe Note, type: :model do
  context 'validity of fields' do
    it 'has a title when created' do
      note = Note.create(:title => "hello")
      expect(note.title).to eq "hello"
    end

    it 'validate on title' do
      nil_note = Note.create(:contents => "hello")
      expect(nil_note).not_to be_valid
    end

    it 'does not allow a priority higher than 3' do
      too_high = Note.create(:title => "hello", :priority => 4)
      expect(too_high).not_to be_valid
    end
  end

  describe '.showing_order' do
    it 'is priority multiplied by time since last shown' do
      low_priority = Note.create(:title => "low", :priority => 1, :date_last_viewed => Date.today)
      Timecop.freeze(Date.today + 5) do
        expect(low_priority.showing_order).to eq 5
      end
    end

    it 'works when priority != 1' do
      high_priority = Note.create(:title => "high", :priority => 3, :date_last_viewed => Date.today)
      Timecop.freeze(Date.today + 5) do
        expect(high_priority.showing_order).to eq 15
      end
    end
  end
end

