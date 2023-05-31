# frozen_string_literal: true

RSpec.describe WordLogic do
  it "has a version number" do
    expect(WordLogic::VERSION).not_to be nil
  end

  #it "does something useful" do
  #  expect(false).to eq(true)
  #end

  it "plays" do
    setWord("ананас")
    expect(in_out("бараны")).to eq([0,2,0,2,1,0])
  end
end