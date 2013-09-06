---
author: jstarrdewar
date: '2012-01-03 22:48:47'
layout: post
slug: rubymine-4-eap-fails-to-install-gems-needed-for-debugging-in-ruby-1-9-3
status: publish
title: RubyMine 4 EAP fails to install gems needed for debugging in Ruby 1.9.3
comments: true
categories:
- IDEs
- IntelliJ Idea
- Ruby
- Ruby on Rails
- RubyMine
- RVM
---

#### Update (8/17/12)

It took four months, but as of Xcode 4.4 and ruby 1.9.3-p194, things are working as intended again.

---

#### Update (4/12/12):

Xcode 4.3 has really thrown a wrench in things.  When ruby 1.9.3 is compiled against clang, debug doesn't work at all.  You'll only find that out if you manage to install the debug gems in the first place, which doesn't work either in RubyMine 4.0.3 (I managed it after a lot of bother only to be disappointed).  Solution?  Go back to 1.9.2.  Things have at least progressed on that point, and we can now use 1.9.2 with gcc alongside Xcode 4.2+.  To do this, follow [John Firebaugh's instructions](http://jfire.io/blog/2012/03/02/xcode-4-dot-3-homebrew-and-ruby/) (He is using it for 1.8.7, but it works just as well for 1.9.2).

With the next patch of ruby 1.9.3, debug should start working again (although it doesn't work in the current head, p179).  In case RubyMine is still refusing to install the debug gems at that point, here's how I did it:
<!-- more -->
First of all, the error message you get is this:

```
Gem::Installer::ExtensionBuildError: ERROR: Failed to build gem native extension.

        /Users/john/.rvm/rubies/ruby-1.9.3-head/bin/ruby extconf.rb
checking for vm_core.h... no
/Users/john/.rvm/gems/ruby-1.9.3-head@huh/gems/ruby_core_source-0.1.5/lib/ruby_core_source.rb:39: Use RbConfig instead of obsolete and deprecated Config.
checking for vm_core.h... no
*** extconf.rb failed ***
Could not create Makefile due to some reason, probably lack of
necessary libraries and/or headers.  Check the mkmf.log file for more
details.  You may need configuration options.

Provided configuration options:
	--with-opt-dir
	--with-opt-include
	--without-opt-include=${opt-dir}/include
	--with-opt-lib
	--without-opt-lib=${opt-dir}/lib
	--with-make-prog
	--without-make-prog
	--srcdir=.
	--curdir
	--ruby=/Users/john/.rvm/rubies/ruby-1.9.3-head/bin/ruby
	--with-ruby-dir
	--without-ruby-dir
	--with-ruby-include
	--without-ruby-include=${ruby-dir}/include
	--with-ruby-lib
	--without-ruby-lib=${ruby-dir}/lib
/Users/john/.rvm/gems/ruby-1.9.3-head@huh/gems/ruby_core_source-0.1.5/lib/contrib/uri_ext.rb:268:in `block (2 levels) in read': Looking for http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p179.tar.gz and all I got was a 404! (URI::NotFoundError)
	from /Users/john/.rvm/rubies/ruby-1.9.3-head/lib/ruby/1.9.1/net/http.rb:1322:in `block (2 levels) in transport_request'
	from /Users/john/.rvm/rubies/ruby-1.9.3-head/lib/ruby/1.9.1/net/http.rb:2671:in `reading_body'
	from /Users/john/.rvm/rubies/ruby-1.9.3-head/lib/ruby/1.9.1/net/http.rb:1321:in `block in transport_request'
	from /Users/john/.rvm/rubies/ruby-1.9.3-head/lib/ruby/1.9.1/net/http.rb:1316:in `catch'
	from /Users/john/.rvm/rubies/ruby-1.9.3-head/lib/ruby/1.9.1/net/http.rb:1316:in `transport_request'
	from /Users/john/.rvm/rubies/ruby-1.9.3-head/lib/ruby/1.9.1/net/http.rb:1293:in `request'
	from /Users/john/.rvm/rubies/ruby-1.9.3-head/lib/ruby/1.9.1/net/http.rb:1286:in `block in request'
	from /Users/john/.rvm/rubies/ruby-1.9.3-head/lib/ruby/1.9.1/net/http.rb:745:in `start'
	from /Users/john/.rvm/rubies/ruby-1.9.3-head/lib/ruby/1.9.1/net/http.rb:1284:in `request'
	from /Users/john/.rvm/gems/ruby-1.9.3-head@huh/gems/ruby_core_source-0.1.5/lib/contrib/uri_ext.rb:239:in `block in read'
	from /Users/john/.rvm/gems/ruby-1.9.3-head@huh/gems/ruby_core_source-0.1.5/lib/contrib/uri_ext.rb:286:in `connect'
	from /Users/john/.rvm/gems/ruby-1.9.3-head@huh/gems/ruby_core_source-0.1.5/lib/contrib/uri_ext.rb:234:in `read'
	from /Users/john/.rvm/gems/ruby-1.9.3-head@huh/gems/ruby_core_source-0.1.5/lib/contrib/uri_ext.rb:128:in `download'
	from /Users/john/.rvm/gems/ruby-1.9.3-head@huh/gems/ruby_core_source-0.1.5/lib/ruby_core_source.rb:55:in `block in create_makefile_with_core'
	from /Users/john/.rvm/rubies/ruby-1.9.3-head/lib/ruby/1.9.1/tempfile.rb:320:in `open'
	from /Users/john/.rvm/gems/ruby-1.9.3-head@huh/gems/ruby_core_source-0.1.5/lib/ruby_core_source.rb:51:in `create_makefile_with_core'
	from extconf.rb:19:in `<main>'
Requesting http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p179.tar.gz

Gem files will remain installed in /Users/john/.rvm/gems/ruby-1.9.3-head@huh/gems/linecache19-0.5.12 for inspection.
Results logged to /Users/john/.rvm/gems/ruby-1.9.3-head@huh/gems/linecache19-0.5.12/ext/trace_nums/gem_make.out
```

It turns out that the relevant portions of the error are these:

```
You may need configuration options.
...
Looking for http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p179.tar.gz and all I got was a 404!

```

This tells you that you need to point it to the copy of ruby-1.9.3 that you installed with RVM.  The configuration option you have to set is `--with-ruby-include`.  If you aren't using RubyMine, you can follow the detailed instructions in [this StackOverflow post](http://stackoverflow.com/questions/6438116/rails-with-ruby-debugger-throw-symbol-not-found-ruby-current-thread-loaderro/9267541#9267541).

However, with RubyMine, there's another problem, which is that if you install the versions of the gems mentioned in the post above, RubyMine won't recognize them.  You need to install the same version of `ruby-debug-base19x` that RubyMine comes bundled with.  You can find that inside the RubyMine.app package.  This is actually a bit simpler than what they're doing over at SO:

```
gem install /Applications/RubyMine.app/rb/gems/ruby-debug-base19x-0.11.30.pre10.gem -- --with-ruby-include=/Users/john/.rvm/src/ruby-1.9.3-head
```

Replace `john` with your username, of course.  And don't forget the extra `--`  Once you've done that, RubyMine should be able to install the rest of the gems it needs for you without further assistance.

---

#### Original Post:

The latest build of RubyMine 4 (112.291) can't debug with an rvm gemset using
ruby 1.9.3 on my iMac. It complains that it is missing the necessary gems,
offers to install them, downloads them and attempts to install them, and then
hangs while 'building native extensions'.

I'm sure this will all be worked out in time for release, but meanwhile here
is a really easy fix: just install the ruby-debug19 gem via the command line.
This, or one of its dependencies, is hanging while building native extensions
when RubyMine attempts the auto-install.

`rvmsudo gem install ruby-debug19`

Wait for that to finish. Now when RubyMine offers to install the missing gems,
it will do so without a hitch (or at least it did for me).