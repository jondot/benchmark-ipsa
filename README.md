# benchmark-ipsa

A iterations per second enhancement to Benchmark that includes memory allocations,
based on [benchmark-ips](https://github.com/evanphx/benchmark-ips/).


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'benchmark-ipsa'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install benchmark-ipsa

## Usage

```ruby
require 'benchmark/ipsa'
Benchmark.ipsa do |x|
  x.report('foo 1'){
    arr = ['1', 2]
    sleep 0.1
  }
  x.report('foo 2'){
    sleep 0.1
  }
end
```

Results:

```
Allocations -------------------------------------
               foo 1       2/0  alloc/ret        1/0  strings/ret
               foo 2       0/0  alloc/ret        0/0  strings/ret
Warming up --------------------------------------
               foo 1     1.000  i/100ms
               foo 2     1.000  i/100ms
Calculating -------------------------------------
               foo 1      9.675  (± 0.0%) i/s -     49.000
               foo 2      9.585  (± 0.0%) i/s -     48.000
```


You can run the specs in this repo to see it live.

For more, see [benchmark-ips](https://github.com/evanphx/benchmark-ips/)

## Development

Running the specs:

* `git clone`
* `bundle install`
* `bundle exec rake spec`

# Contributing

Fork, implement, add tests, pull request, get my everlasting thanks and a respectable place here :).

# Copyright

Copyright (c) 2016 [Dotan Nahum](http://gplus.to/dotan) [@jondot](http://twitter.com/jondot). See [LICENSE](LICENSE.txt) for further details.

