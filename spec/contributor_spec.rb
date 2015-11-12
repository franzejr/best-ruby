require "./lib/contributor"

describe Contributor do
  let!(:contributor) { 'luke' }
  let!(:original_markdown) { File.open('CONTRIBUTORS.md', 'r').read }

  after do
    File.write('CONTRIBUTORS.md', original_markdown)
  end

  subject { described_class.new(contributor) }

  describe "#add" do
    it "adds a contributor" do
      subject.add
      expect(File.open('CONTRIBUTORS.md', 'r').read).to match '@luke'
    end
  end
end
