require "benchmark/ipsa/version"
require 'memory_profiler'
require 'benchmark/ips'

module Benchmark
  module Ipsa
    def ipsa(*args, &block)
      Benchmark.ips(*args){ |x|
        block.call(x)
        allocations(x)
      }

    end

    def allocations(x)
      return unless RUBY_VERSION >= "2.1.0" # MemoryProfiler needs 2.1. degrade to just ips

      puts "Allocations -------------------------------------"
      x.list.each do |entry|
        report = MemoryProfiler.report(&entry.action)
        $stdout.print(rjust(entry.label))
        $stdout.printf("%10s  alloc/ret %10s  strings/ret\n",
                       "#{report.total_allocated}/#{report.total_retained}",
        "#{report.strings_allocated.count}/#{report.strings_retained.count}")
      end
    end

    def rjust(label) #stolen from benchmark-ips
      label = label.to_s
      if label.size > 20
        "#{label}\n#{' ' * 20}"
      else
        label.rjust(20)
      end
    end

    # Your code goes here...
  end
  extend Ipsa
end
