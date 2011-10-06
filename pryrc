Pry.config.editor = "mate -w"

prompt = "\e[1;30m"
if defined?(Rails)
  prompt << "#{Rails.application.to_s.split("::").first.gsub(/#</, '')} on Rails #{Rails.version}@" if defined?(Rails)
end
prompt << "#{RUBY_VERSION}"
Pry.config.prompt = proc {|obj, nest_level, _| "#{prompt} (#{obj})>\e[0m "}

Pry.config.exception_handler = proc do |output, exception, _|
  output.puts "\e[31m#{exception.class}: #{exception.message}"
  output.puts "from #{exception.backtrace.first}\e[0m"
end

begin
  require "awesome_print"
  Pry.config.print = proc {|output, value| Pry::Helpers::BaseHelpers.stagger_output("=> #{value.ai}", output)}
rescue LoadError => err
   puts "=> Unable to load awesome_print"
end

# Determining whether a pager will be used for long output
Pry.config.pager = false

# Load plugins (only those I whitelist)
Pry.config.should_load_plugins = false
Pry.plugins["doc"].activate!
