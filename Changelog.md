# Rainbow changelog

## 1.0.0

* initial version

## 1.0.1

* Windows support

## 1.0.2

* improved support for ruby 1.8.6 and 1.9.1

## 1.0.3

* rainbow methods don't mutate the original string object anymore

## 1.0.4

* support for 256 colors

## 1.1

* option for enabling/disabling of escape code wrapping
* auto-disabling when STDOUT is not a TTY

## 1.1.1

* improved Windows support

## 1.1.2

* improved compatibility with MRI 1.9.3

## 1.1.3

* improved compatibility with MRI 1.8.7
* fix for regression with regards to original string mutation

## 1.1.4

* option for forcing coloring even when STDOUT is not a TTY (CLICOLOR_FORCE env var)
* fix for frozen strings

## 1.99.0

* preparation for dropping String monkey patching
* `require "rainbow/string"` if you want to use monkey patched String
* introduction of Rainbow() wrapper
* support for MRI 1.8.7, 1.9.2, 1.9.3, 2.0 and 2.1, JRuby and Rubinius
* deprecation of Sickill::Rainbow namespace (use Rainbow.enabled = true instead)

## 1.99.1

* drop support for ruby 1.8
* `require "rainbow/string"` -> `require "rainbow/ext/string"`
* custom rainbow wrapper instances (with separate enabled/disabled state)
* shortcut methods for changing text color (`Rainbow("foo").red`)
