require 'spec_helper'
require 'benchmark/ips'

describe Benchmark::Ipsa do
  it 'should pass' do

    std, _ = capture_io {
      Benchmark.ipsa do |x|
          x.report('foo 1'){
            arr = ['1', 2]
            sleep 0.1
          }
          x.report('foo 2'){
            sleep 0.1
          }
      end
    }

    puts std
    std.lines.first(3).join.must_equal(<<-EOF)
Allocations -------------------------------------
               foo 1       2/0  alloc/ret        1/0  strings/ret
               foo 2       0/0  alloc/ret        0/0  strings/ret
    EOF
  end
end
