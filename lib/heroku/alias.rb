module Heroku::Alias
  def run_with_alias(cmd, arguments=[])
    parser = Parser.new(cmd, arguments)
    run_without_alias(parser.cmd, parser.arguments)
  end

  class Parser
    attr :cmd
    attr :arguments

    def initialize(cmd, arguments)
      replacement = (aliases(cmd) || cmd).split(" ")
      @cmd = replacement.shift
      @arguments = replacement + arguments
    end

    private

    def aliases(cmd)
      config = Heroku::Alias::Config.new
      commands = config["alias"] || {}
      return commands[cmd]
    end
  end
end

module Heroku::Command
  extend Heroku::Alias

  class << self
    alias_method :run_without_alias, :run
    alias_method :run, :run_with_alias
  end
end
