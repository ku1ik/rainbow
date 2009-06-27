Rainbow
=======

About
-----

Rainbow extends ruby String class adding methods to wrap the string with "ANSI escape codes":http://en.wikipedia.org/wiki/ANSI_escape_code. 

Features
--------

Rainbow adds following methods to String class:

* foreground(color) (with _color_ and _colour_ aliases)
* background(color)
* reset
* bright
* italic (not well supported by terminal emulators).
* underline
* blink
* inverse
* hide.

Color can be one of following symbols: :black, :red, :green, :yellow, :blue, :magenta, :cyan, :white and :default.

Each of those methods returns string wrapped with some ANSI codes so you can chain calls as in example above.

It also has Windows support (uses win32console gem if installed, otherwise strings are returned unaltered).

Usage
-----

    require 'rainbow'
    puts "this is red".foreground(:red) + " and " + "this on yellow bg".background(:yellow) + " and " + "even bright underlined!".underline.bright
