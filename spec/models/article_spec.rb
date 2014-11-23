describe Article do

  context "base" do
    it "has a valid factory" do
     expect(create(:article)).to  be_valid
   end
  end

  context "validations" do
    it { expect(subject).to validate_presence_of(:name) }
    it { expect(subject).to validate_presence_of(:description) }
    it { expect(subject).to validate_presence_of(:price) }
    it { expect(subject).to validate_presence_of(:total_in_vault) }
    it { expect(subject).to validate_presence_of(:total_in_shelf) }
    it { expect(subject).to validate_presence_of(:store_id) }
  end
end