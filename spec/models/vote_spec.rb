describe Vote do
  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        describe '#up_vote' do
          it "should equal 1" do
            expect(up_vote).to eq(1)
          end
        end
        
        describe '#down_vote' do
          it "should equal -1" do
            expect(down_vote).to eq(-1)
          end
        end
      end
    end
  end
end