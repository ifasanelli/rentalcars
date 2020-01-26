require 'rails_helper'

describe Rental do
  describe '#start_date_cannot_be_in_the_past' do
    it 'validates successfully' do
      rental = Rental.new(start_date: 1.day.ago, end_date: Date.current)

      rental.valid?

      expect(rental.errors.full_messages).to include('Start date Data inicial não pode ser antes de hoje')
    end
  end

  describe '#end_date_cannot_be_before_start_date' do
    it 'validates successfully' do

      rental = Rental.new(start_date: Date.current , end_date: 1.day.ago)

      rental.valid?

      expect(rental.errors.full_messages).to include('End date Data final não pode ser antes da data inicial')
    end
  end
end
