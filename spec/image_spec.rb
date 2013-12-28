require './image'

describe 'Image' do 

let(:image) { Image.new(10, 10) }

  it "should be initialized with a dimensions of Height * Width" do
    expect(image.pixels).to be_instance_of(Array)
    expect(image.width).to eq(10)
    expect(image.height).to eq(10)
    image.pixels.flatten.all? {|pixel| expect(pixel).to eq('O')}
  end

  it "should be able to color the image at x,y with a colour C" do
    image.color(4, 5, 'C')
    expect(image.pixels[4][3]).to eq('C')
  end

  it "should be able to clear the image" do
    image.color(4, 5, 'C')
    image.clear
    image.pixels.flatten.all? {|pixel| expect(pixel).to eq('O')}
  end

  context "In column X between rows Y1 and Y2" do
    it "should draw a vertical segment of colour C" do
      image.vertical(4, 5, 6, 'C')
      expect(image.pixels[5][3]).to eq('C')
    end
  end

  context "In row Y between columns X1 and X2" do
    it "should draw a horizontal segment of colour C" do
      image.horizontal(2, 5, 3, 'C')
      expect(image.pixels[2][3]).to eq('C')
    end
  end

  it 'should show the image content' do
    image.vertical(4, 5, 6, 'C')
    image.horizontal(2, 5, 3, 'C')
    expect(image.show).to eq('OOOOOOOOOOOOOOOOOOOOOCCCCOOOOOOOOOOOOOOOOOOCOOOOOOOOOCOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO')
  end
end