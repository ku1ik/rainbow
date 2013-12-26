# Rainbow

[![Build Status](https://travis-ci.org/sickill/rainbow.png?branch=master)](https://travis-ci.org/sickill/rainbow)
[![Code Climate](https://codeclimate.com/github/sickill/rainbow.png)](https://codeclimate.com/github/sickill/rainbow)
[![Coverage Status](https://coveralls.io/repos/sickill/rainbow/badge.png)](https://coveralls.io/r/sickill/rainbow)

Rainbow is a ruby gem for colorizing printed text on ANSI terminals.

It provides a string wrapper object that allows for wrapping a string with
[ANSI escape codes](http://en.wikipedia.org/wiki/ANSI_escape_code). These codes
when printed in a terminal change text attributes like text color, background,
intensity etc.

## Example

```ruby
require 'rainbow'

puts Rainbow("this is red").color(:red) + " and " + Rainbow("this on yellow bg").background(:yellow) + " and " + Rainbow("even bright underlined!").underline.bright
```

## API

Following methods are available on a string wrapper object:

* `foreground(color)` (with `color` and `colour` aliases)
* `background(color)`
* `bright`
* `underline`
* `blink`
* `inverse`
* `hide`
* `italic` (not well supported by terminal emulators).

All of the methods return wrapped string so you can chain method calls as in
the above example.

### String mixin

If you prefer not to wrap every string you want to colorize with `Rainbow()`
you can include all the rainbow methods in a String class directly by requiring
`rainbow/string`:

```ruby
require 'rainbow/string'

puts "this is red".color(:red) + " and " + "this on yellow bg".background(:yellow) + " and " + "even bright underlined!".underline.bright
```

This way of using Rainbow is not recommended though as it pollutes String's
public interface with methods that are presentation specific.

NOTE: the mixin is included in String by default in rainbow 1.99 to not break
backwards compatibility. It won't be included by default in rainbow 2.0.

### Color specification

Both `foreground/color/colour` and `background` accept color specified in any
of the following ways:

* color number (where 1 is red, 2 is green and so on):
  `Rainbow("hello").foreground(1)`

* color name as a symbol (available: :black, :red, :green, :yellow, :blue,
  :magenta, :cyan, :white):
  `Rainbow("hello").foreground(:yellow)`

* RGB triplet as separate values in the range 0-255:
  `Rainbow("hello").foreground(115, 23, 98)`

* RGB triplet as a hex string:
  `Rainbow("hello").foreground("FFC482")` or `Rainbow("hello").foreground("#FFC482")`

When you specify a color with a RGB triplet rainbow finds the nearest match
from 256 colors palette. Note that it requires a 256-colors capable terminal to
display correctly.

## Windows support

For Windows support, you should install the following gems:

```ruby
gem install windows-pr win32console
```

If the above gems aren't installed then all strings are returned unmodified.

## Configuration

Rainbow can be enabled/disabled globally by setting:

```ruby
Rainbow.enabled = true/false
```

When disabled all the methods return an unmodified string
(`Rainbow("hello").color(:red) == "hello").

It's enabled by default, unless STDOUT/STDERR is not a TTY or a terminal is
dumb.

## Installation

Add it to your Gemfile:

```ruby
gem 'rainbow'
```

Or just install it via rubygems:

```ruby
gem install rainbow
```

## Authors

[Marcin Kulik](http://ku1ik.com/) and [great open-source contributors](https://github.com/sickill/rainbow/graphs/contributors).
