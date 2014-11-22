describe Store do

  context "base" do
    it "has a valid factory" do
     expect(create(:store)).to  be_valid
   end
  end

  context "validations" do
    it { expect(subject).to validate_presence_of(:name) }
    it { expect(subject).to validate_presence_of(:address) }
  end
end