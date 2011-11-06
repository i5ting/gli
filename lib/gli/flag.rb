require 'gli/command_line_token.rb'
require 'gli/switch.rb'

module GLI
  # Defines a flag, which is to say a switch that takes an argument
  class Flag < Switch # :nodoc:

    attr_accessor :default_value

    def initialize(names,options)
      super(names,options)
      @argument_name = options[:arg_name] || "arg"
      @default_value = options[:default_value]
    end

    # Returns a string of all possible forms
    # of this flag.  Mostly intended for printing
    # to the user.
    def all_forms(joiner=', ')
      forms = all_forms_a
      string = forms.join(joiner)
      if forms[-1] =~ /^\-\-/
        string += '='
      else
        string += ' '
      end
      string += @argument_name
      return string
    end

    def self.name_as_string(name)
      string = name.to_s
      string.length == 1 ? "-#{string}" : "--#{string}"
    end
  end
end
