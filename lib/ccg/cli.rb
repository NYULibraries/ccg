require_relative './text'

module Ccg
  class CLI < Thor

    desc "text SUBCOMMAND", "Look and Feel Text commands"
    subcommand "text", Ccg::Text

  end
end

