require 'nyudl/text'
require 'pp'

module Ccg
  # Look and Feel Text
  class Text < Thor
    class_option :verbose, :type => :boolean
    class_option :noop,    :type => :boolean

    option :dir,        :required => true,  :aliases => :d
    option :prefix,     :required => true,  :aliases => :p
    option :new_prefix, :required => false, :aliases => :n
    option :force,      :required => false, :aliases => :f, :type => :boolean, :default => false

    option :fr_digits_max, :required => false, :type => :numeric, :default => 2 # max allowable digits in fr fragments
    option :fr_digits_out, :required => false, :type => :numeric, :default => 2 # # of digits in fr output fragments
    option :bk_digits_max, :required => false, :type => :numeric, :default => 2 # max allowable digits in bk fragments
    option :bk_digits_out, :required => false, :type => :numeric, :default => 2 # # of digits in bk output fragments
    option :in_digits_max, :required => false, :type => :numeric, :default => 2 # max allowable digits in insert fragments
    option :in_digits_out, :required => false, :type => :numeric, :default => 2 # # of digits in insert output fragments

    desc "fix_names", "bulk filename correction from known patterns to canonical pattern"
    def fix_names

      # extract parameters
      dir    = options[:dir]
      prefix = options[:prefix]
      errors = []

      text = Nyudl::Text::Base.new(dir, prefix, options)

      text.analyze
      Ccg::return_true("Text is valid. No changes required. Thank you for using #$0!") if text.valid?
      Ccg::return_false("Unrecognized files detected: #{text.errors}") unless text.recognized?

      puts "-------------------------------------------------------------------------------"
      puts "RENAME PLAN"
      puts "-------------------------------------------------------------------------------"

      text.renames.each do |h|
        printf("%30s   ->   %30s\n", h[old_name:], h[new_name:])
      end

      puts "-------------------------------------------------------------------------------"
      $stdout.flush
      $stderr.flush

      # provide prompt unless force flag is set
      unless options[:force]
        puts "Do you want to continue with rename operation?"
        puts "(anything by Y aborts operation):"
        $stdout.flush
        $stderr.flush
        answer = $stdin.gets.chomp

        unless (answer == 'y' || answer == 'Y')
          puts "OPERATION ABORTED"
          return true
        end
      end

      text.rename!

      puts "\nRENAME OPERATION COMPLETE"
      puts "thank you for using #$0 "
      puts "goodbye..."
      puts "-------------------------------------------------------------------------------"
      $stdout.flush
      $stderr.flush
      return true
    end

  end
end
