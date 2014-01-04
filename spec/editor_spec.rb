require './editor'
require './command'


describe "Editor" do
  let(:editor) { Editor.new }

  it "should create a new image" do
    editor.stub(:user_input) {'I 5 10'}
    Command.any_instance.should_receive(:parse).with('I 5 10')
    editor.execute
  end
end