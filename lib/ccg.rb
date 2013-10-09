require_relative "./ccg/version"
require_relative "./ccg/cli"
require_relative "./ccg/text"

module Ccg
  def self.exit_ok(msg)
    puts msg
    exit 0
  end
  def self.exit_err(msg)
    puts msg
    exit 1
  end
  def self.return_true(msg)
    puts msg
    return true
  end
  def self.return_false(msg)
    puts msg
    return false
  end
end
