---
author: jstarrdewar
date: '2011-11-04 13:52:30'
layout: post
slug: ruby-segmentation-faults-and-abort-trap-6-in-lion-some-solutions
status: publish
title: 'Ruby Segmentation Faults and Abort Trap 6 in Lion: Some Solutions'
comments: true
categories:
- Apple
- Lion
- Ruby
- RVM
---

Jump to the bottom of this post for updates about the Xcode 4.2+/ruby problems that are finally starting to get worked out.  Latest update: 9/29/2012

If you run into an error message with `Segmentation Fault: Abort Trap 6`, the
issue could be caused by the version of OpenSSL bundled with MacPorts’
PostgreSQL installer.  Or it could be caused by the updated C compiler included with the latest version of Xcode.  Let's look at some workarounds to these issues.<!-- more -->

First, the issue with MacPorts' PostgreSQL/OpenSSL distribution.  See the following discussion from the Ruby website:

[http://redmine.ruby-lang.org/issues/4373#note-61](http://redmine.ruby-lang.org/issues/4373#note-61)

The "solution" is to change your ActionMailer settings to not use the library.
That's an OK stopgap but it's a better idea to just get rid of your MacPorts
install. That's because I have found that my MacPorts PostgreSQL install has
gotten borked with each Mac OS 10.7.x update, because Lion has its own
PostgreSQL database.

I got it working again the first time, but the second time it happened, I
decided to switch to the [Homebrew](http://mxcl.github.com/homebrew/) version, which is insulated against the
system's. Therefore, I recommend that if you had installed it from MacPorts on
Snow Leopard, you should uninstall it before moving to Lion, and install the
version from Homebrew once your upgrade is complete.

(I'm not sure what Lion uses its built-in PostgreSQL for, if anything.
However, I did manage to screw up an older installation of Mac OS X by
experimenting with the built-in MySQL database a couple years back, and while
I didn't experience any data loss from that incident, I would rather not risk
having to waste the time restoring my Lion install. So Homebrew it is.)

---

You may also run into a segmentation fault caused by a screwed-up ruby
compile. By default some versions of RVM used LLVM to compile new Rubies
(which currently need to be compiled with gcc) under Lion.

(Read the updates below before following any of these instructions. The best way to do this keeps changing.)

Add this to .bashrc :

`export CC=/usr/bin/gcc-4.2`

If you had already installed ruby with LLVM it might still have compiled cache
files around. In that case use the rvm force command

`rvm install 1.9.2 --force`

#### Update #1:
The latest version of RVM has accounted for this issue and automatically exports CC=/usr/bin/gcc-4.2 for you
(*.rvm/scripts/functions/build::line 7*). However, merely upgrading RVM won't
fix the issue; you still have to rebuild your rubies.

#### Update #2:
The latest notes for RVM carry this warning:

> ** Lion Users: Xcode Version 4.2.x for OS X Lion works only for ruby
1.9.3-p0 (or higher). It currently fails to build several other rubies and
gems, as well as several Homebrew and Macports packages. Xcode Version 4.1
(4B110) works.

> Xcode 4.2 users - please be warned - in case of any compilation issues
downgrade to Xcode 4.1 and reinstall your rubies.

  
  
Looks like those of us who want to do iOS development as well as Ruby
development are stuck between a rock and a hard place for the moment.

#### Update #3:
I haven't been affected by any ruby compilation issues since switching my development
environment to 1.9.3p0, and I have a pretty common set of gems. So your
mileage may vary, but if you need to use a newer version of Xcode you should
definitely try an RVM gemset based on 1.9.3 and see if it clears up the
trouble.

#### Update #4:
While I still haven't run into any issues since upgrading to 1.9.3 (knock on wood) - and I'm using the pg driver for PostgreSQL - the latest RVM release notes offer some new solutions:

>Xcode 4.2:
 * is only supported by ruby 1.9.3+ using command line flag: --with-gcc=clang
 * it breaks gems with native extensions, especially DB drivers.

>Xcode 4.2 users - please be warned -
in case of any compilation issues
 * downgrade to Xcode 4.1
 * or install osx-gcc-installer
and reinstall your rubies.

Here is the link to [osx-gcc-installer](https://github.com/kennethreitz/osx-gcc-installer).

That bit about the command line flag is a bit cryptic.  He means that when installing a new ruby, use that argument for RVM, like this:

`rvm install 1.9.3 --with-gcc=clang`

#### Update #5:
I was forced to upgrade to Xcode 4.3 and as a result I've been having a lot of problems with the clang-compiled version of 1.9.3.  The chief issue is that I can't use ruby-debug-ide with RubyMine, and I find that to be an extremely valuable tool.  Meanwhile, a better solution than osx-gcc-installer has come along, which doesn't clobber Xcode 4.3's special Frankenstein version of gcc.  For that, follow [John Firebaugh's instructions](http://jfire.io/blog/2012/03/02/xcode-4-dot-3-homebrew-and-ruby/).  If you are using an IDE, I recommend installing gcc 4.2 and then moving back to ruby 1.9.2 for the time being (or compiling 1.9.3 with gcc - but RVM will automatically add `--with-gcc=clang` now, so you'll have to specify your newly installed version of gcc instead using `--with-gcc=gcc-4.2`).

#### Update #6:
Looks like the kinks are finally worked out.  With Ruby 1.9.3-p194 and Xcode 4.4, I had no issues following the default installation procedures on Mountain Lion.  RubyMine auto-installed the ruby-debug-ide without problems.