require "irb/completion"         # activate default completion
require "irb/ext/save-history"   # activate default history
require "tempfile"               # used for Vim integration

IRB.conf[:SAVE_HISTORY] = 10000
IRB.conf[:HISTORY_FILE] = "#{ENV["HOME"]}/.irb_history"
IRB.conf[:AUTO_INDENT]  = true
IRB.conf[:PROMPT_MODE]  = :SIMPLE

gems = {
  :rubygems => proc { true },
  :wirble => proc {
    Wirble.init(:skip_prompt=>true,:skip_history=>true)
    Wirble.colorize
  },
  :hirb => proc { Hirb.enable },
  :ap => proc {
    IRB::Irb.class_eval do
      def output_value
        if @context.inspect?
          ap(@context.last_value)
        else
          printf @context.return_format, @context.last_value
        end
      end
    end
   }
}

gems.each do |gemname, config|
  begin
    require gemname.to_s
    puts "Autoloaded '#{gemname}'"
    config.call
  rescue LoadError => e
    puts "Seems you don't have #{gemname} installed: #{e}"
  end
end

load "~/.irbeditorrc"

IRB.conf[:IRB_RC] = Proc.new do
  if defined?(ActiveRecord)
    require 'logger'
    # Replace ActiveRecord logger
    ActiveRecord::Base.logger = Logger.new(STDOUT)

    # Set up ActiveRecord shortcut
    ActiveRecord::Base.instance_eval { alias :[] :find }
  end
end
