require './command'

describe "Command" do

  let(:command) { Command.new }

 
  it 'should create a new image when passed I X Y' do
    image = command.parse('I 5 10')
    expect(image).to be_an_instance_of(Image)
    expect(image.width).to eq(10)
    expect(image.height).to eq(5)
  end

  it "should color an image when passed L X Y C" do
    image = command.parse('I 10 10')
    image.should_receive(:color).with(4, 5, "C")
    command.parse('L 4 5 C')
  end

  it "should create a vertical segment of color" do
    image = command.parse('I 10 10')
    image.should_receive(:vertical).with(4, 5, 6, 'C')
    command.parse('V 4 5 6 C')
  end

  it "should create a horizontal segment of color" do
    image = command.parse('I 10 10')
    image.should_receive(:horizontal).with(2, 5, 3, 'C')
    command.parse('H 2 5 3 C')
  end

  it "should be able to floodfill the image" do
    image = command.parse('I 10 10')
    image.should_receive(:floodfill).with(9, 2, 'C')
    command.parse('F 9 2 C')
  end

  it "should show the image when passed S" do
    image = command.parse('I 10 10')
    image.should_receive(:show)
    command.parse('S')
  end

  it "should exit when passed X" do
    expect { command.parse('X')}.to raise_error(SystemExit)
  end
end