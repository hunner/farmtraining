module Puppet::Parser::Functions
  newfunction(:join, :type => :rvalue) do |args|
    char = args.pop
    args.join(char)
  end
end
