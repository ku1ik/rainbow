Rainbow
=======

![build status](https://secure.travis-ci.org/sickill/rainbow.png)

About
-----

Rainbow extends ruby String class adding methods to wrap the string with [ANSI escape codes](http://en.wikipedia.org/wiki/ANSI_escape_code).

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

Each of those methods returns string wrapped with some ANSI codes so you can chain calls as in example above.

Color can be one of following symbols:

    :black, :red, :green, :yellow, :blue, :magenta, :cyan, :white, :default

If you have 256-colors capable terminal you can also specify color in RGB which will find the nearest match from 256 colors palette: 

    "Jolacz".color(115, 23, 98)
    "Jolacz".color("#FFC482")
    "Jolacz".color("FFC482")

For support on Windows, you should install the following gems:

  gem install windows-pr win32console

If the gems aren't installed strings are simply returned unaltered.

Rainbow can be disabled globally by setting:

    Sickill::Rainbow.enabled = false

It will be disabled by default if it detects that STDOUT is not a TTY.

Installation
------------

    gem install rainbow

Usage
-----

    require 'rainbow'
    puts "this is red".foreground(:red) + " and " + "this on yellow bg".background(:yellow) + " and " + "even bright underlined!".underline.bright

Rails Usage
-----------

You're probably wanting to add colour to your logs. To do so you must explicity enable rainbow because it will detect that STDOUT (ie: the log file) is not a TTY.
To make things easy, create the file `config/initializers/rainbow.rb` and include the following:

    require 'rainbow'
    Sickill::Rainbow.enabled = true

Authors
-------

* Marcin Kulik
* Xavier Nayrac

