require 'operation.rb'

RSpec.describe Operation do
  describe '#add_numbers' do
    before do
      @operation = Operation.new
    end

    context 'when value is an empty string' do
      it 'returns 0' do
        expect(@operation.sum_numbers("")).to eq(0)
      end
    end

    context 'when value is contains a single number' do
      it 'returns the number' do
        expect(@operation.sum_numbers("10")).to eq(10)
      end
    end

    context 'when value contains multiple numbers separated by commas' do
      it 'returns the sum of the numbers' do
        expect(@operation.sum_numbers("2,3,4")).to eq(9)
      end
    end

    context 'when string contains negative numbers' do
      it 'raises an exception with negative numbers' do
        expect { @operation.sum_numbers("7,-4,2,-8") }.to raise_error(StandardError, "Can not enter negative numbers: -4,-8")
      end
    end

    context 'when value contains a custom delimiter' do
      it 'returns the sum of the numbers include in the string' do
        expect(@operation.sum_numbers("//;\n1;1;5")).to eq(7)
      end
    end

    context 'when string contains numbers separated by spaces' do
      it 'returns the sum of the numbers' do
        expect(@operation.sum_numbers("2, 4")).to eq(6)
      end
    end

    context 'when value contains new line at the end' do
      it 'raises an exception with invalid value' do
        expect { @operation.sum_numbers("1,\n") }.to raise_error(StandardError, "invalid value")
      end
    end
  end
end
