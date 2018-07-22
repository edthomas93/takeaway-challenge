require 'order'

describe Order do
  it { is_expected.to be_a Order }

  describe '#print_menu' do
    it' is expected to print the menu items' do
      expect(subject.print_menu).to be_a Hash
    end
  end

  describe '#select(selection)' do
    it 'raises an error if the item is not on the menu' do
      expect { subject.select("TV") }.to raise_error 'TV is not on the menu'
    end

    it 'adds selection to selections if item on menu' do
      subject.select("Miso Soup")
      expect(subject.selections).to eq ["Miso Soup"]
    end
  end

  describe '#remove(selection)' do
    it 'raises an error if item not previously selected' do
      expect { subject.remove("Steamed Rice") }.to raise_error 'Steamed Rice was not previously selected'
    end

    it 'removes item from selection if previously selected' do
      subject.select("Katsu Curry")
      subject.remove("Katsu Curry")
      expect(subject.selections).to eq []
    end

    it 'subtracts the price of the meal from total cost' do
      subject.select("Steak Bulgogi")
      subject.select("Yasai Pad Thai")
      subject.remove("Yasai Pad Thai")
      expect(subject.view_cost).to eq 14.5
    end
  end

  describe '#view_selections' do
    it 'raises an error if not selected any items' do
      expect { subject.view_selections }.to raise_error 'No items have been selected'
    end

    it 'shows selections if one or more item selected' do
      subject.select("Steamed Rice")
      subject.select("Chicken Ramen")
      expect(subject.view_selections).to eq(["Steamed Rice", "Chicken Ramen"])
    end
  end

  describe '#view_cost' do
    it 'shows total cost of order' do
      subject.select("Miso Soup")
      subject.select("Yasai Pad Thai")
      expect(subject.view_cost).to eq 11.9
    end
  end
end
