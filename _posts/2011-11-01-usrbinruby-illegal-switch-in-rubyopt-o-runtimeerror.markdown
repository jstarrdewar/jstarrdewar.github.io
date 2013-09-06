---
author: jstarrdewar
date: '2011-11-01 15:54:03'
layout: post
slug: usrbinruby-illegal-switch-in-rubyopt-o-runtimeerror
status: publish
title: '/usr/bin/ruby: illegal switch in RUBYOPT: -o (RuntimeError)'
comments: true
categories:
- Ruby
- RVM
---

As I'm transitioning most of my code to Ruby 1.9.2 (using RVM to manage my gems), I have been seeing this error a lot:

`/usr/bin/ruby: illegal switch in RUBYOPT: -o (RuntimeError)`

Awful isn’t it? What’s happening?
<!-- more -->
When you are running Ruby 1.9.2+ in RVM, the RUBYOPT environment variable is
set to "-r openssl". This is interpreted by 1.8.7 and below as "-o" which it
doesn’t understand, of course. The trick is to set RUBYOPT="". You can do this
automatically by pasting the following code ot the END of the
~/.rvm/hooks/after_use script:
``` sh
if echo $rvm_ruby_version | grep -q '1.9'; then
  export RUBYOPT='-r openssl'
else
  export RUBYOPT=
fi
```
There are some use-cases that require you to run the export command manually, for example when
you are dealing with Homebrew, which runs on the system Ruby if you use their
standard install script. In that case just type `export RUBYOPT=` into the
command prompt, hit enter, and continue with what you were doing.

See the answer on Stack Overflow: [http://stackoverflow.com/questions/6117302/how-to-set-rubyopt-for-only-specific-rvm-versions](http://stackoverflow.com/questions/6117302/how-to-set-rubyopt-for-only-specific-rvm-versions)

