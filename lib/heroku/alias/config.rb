module Heroku
  module Alias
    class Config
      def initialize(path="#{Heroku::Helpers.home_directory}/.heroku/config")
        @path = path
        @aliases = {}
        parse!
      end

      def [](key)
        @aliases[key]
      end

      private

      def parse!
        return unless File.exists?(@path)
        scanner = StringScanner.new(File.read(@path))
        index = nil

        until scanner.eos? do
          scanner.skip(/(\n|\s|\t)*/)
          scanner.scan(/\[|\w+|\z/)
          case scanner.matched
            when "["
              scanner.scan(/\w+/)
              index = scanner.matched
              scanner.scan(/\]/)
            when /\w+/
              cmd_alias = scanner.matched
              scanner.skip(/\s+=\s+/)

              scanner.scan_until(/[^\n]*/)
              cmd_complete = scanner.matched

              return unless index && cmd_alias && cmd_complete
              @aliases[index] ||= {}
              @aliases[index][cmd_alias] = cmd_complete
          end
        end
      end
    end
  end
end
