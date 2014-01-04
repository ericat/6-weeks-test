require_relative 'command'

class Editor

  def initialize
    @command = Command.new
  end

  def execute
    @command.parse(user_input)
  end

  private
  
  def user_input
    gets.chomp
  end


end