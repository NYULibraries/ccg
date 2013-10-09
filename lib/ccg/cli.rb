module Ccg
  class CLI < Thor

    desc "text SUBCOMMAND", "Look and Feel Text commands"
    subcommand "text", Text

  end
end

