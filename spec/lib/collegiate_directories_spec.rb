require "pp"

RSpec.describe CollegiateDirectories do
  describe "#coaches_for" do
    context "rodeo" do
      subject { described_class.new.coaches_for(:rodeo) }

      it { is_expected.to include("Coaches" => a_kind_of(Array)) }
      it { is_expected.to include("Message" => "Success") }
      it { is_expected.to include("ResultCode" => 0) }
    end

    context "rollerball" do
      subject { described_class.new }

      it "raises an error" do
        expect { subject.coaches_for(:rollerball) }
          .to raise_error(CollegiateDirectories::SportNotFound)
      end
    end
  end

  describe "#sports" do
    subject { described_class.new.sports }

    it { is_expected.to include("Message" => "Success") }
    it { is_expected.to include("ResultCode" => 0) }
    it { is_expected.to include("Sports" => a_kind_of(Array)) }
  end
end
