---
layout: post
title: "RVM and IntelliJ/RubyMine Integration Tip"
date: 2012-02-10 12:17
comments: true
description: Use a .rvmrc file to make switching gemset in IntelliJ IDEA or RubyMine painless
categories:
- Ruby
- IDEs
- RubyMine
- IntelliJ IDEA
---

This is just a quick tip:  I mentioned in passing in a [previous article](/blog/2012/01/22/rvm-for-python-setting-up-virtualenv-and-virtualenvwrapper-on-lion/) that in RVM, we have the ability to cause a specific gemset to load when opening a directory in terminal by saving a plaintext file named `.rvmrc` in the project root directory, with the gemset specified on a single line inside like this: `rvm use ruby-1.9.3-p0@my_gemset`

Now this is particularly worthwhile if you are using an IDE like RubyMine or IntelliJ that features RVM integration.  If you don't have an .rvmrc file the IDE doesn't know which gemset to use.  To change it you have to go to _Preferences > Ruby SDK & Gems_ in RubyMine or _Preferences > Project Structure > SDKs_ in IntelliJ.  Particularly in the latter case it's a lot less convenient than switching gemsets on the command line.  If you do add an .rvmrc file, the IDE is able to read it and will choose the appropriate gemset automatically, saving you lots of time.

The last issue is whether or not you should check the .rvmrc file into version control.  I lean towards 'yes' on this one but it's up to the preferences of your team.  Some people might not appreciate you dictating the name of their gemsets.  On the other hand if you're a team lead, it will help you keep junior team members from running the app in a polluted gemset because they never bother to create new ones.

It's definitely a bad idea to check in your .rvmrc to a project hosted on GitHub or other open source repository because you have no knowledge of how people in the wild have set up their gemsets, and you don't want to cause conflicts.  For example, you might have a gemset called 1.9.3@blog and they might have one under the same name for a completely different project with different gem requirements.  If they open the project and they aren't paying attention they might bundle install and screw up the existing project, and then they'll have to rebuild their gemsets which will probably annoy them greatly.