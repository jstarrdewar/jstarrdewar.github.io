---
layout: post
title: "Migrating Wordpress Data to Octopress/Jekyll"
date: 2012-01-21 23:34
comments: true
categories:
- Ruby
- Python
- Octopress
- Wordpress
---

In keeping with an apparent tradition, I will discuss the process of moving my data from Wordpress.com to Octopress.  It was not an entirely trouble-free process.  All of the following advice applies to Jekyll, not just Octopress.

First of all, the default migration script failed to run.  I couldn't find any advice on the subject online, so I decided to try [exitwp](https://github.com/thomasf/exitwp) instead.

<!-- more -->

Once you have cloned the repo you need to install the dependencies.  The instructions on Github are linux-specific.  The only tricky part is that you need to install libyaml.  Instead of using apt-get, just grab it from homebrew:

`brew install libyaml`

Then you can run:

`pip install --upgrade  -r pip_requirements.txt`

This step will compile libyaml.  Note that if you are not using virtualenv (see below) you should preface that command with `sudo`.

Mac OS X Lion does not come with [pip](http://www.pip-installer.org) installed.  You can follow the instructions here: [http://www.pip-installer.org/en/latest/installing.html](http://www.pip-installer.org/en/latest/installing.html)

Note that the recommended way to get pip is via [virtualenv](http://pypi.python.org/pypi/virtualenv).  Virtualenv is essentially the Python equivalent of [RVM](http://beginrescueend.com/) (discussed [often](/blog/categories/rvm/) on this blog).  However to achieve feature-parity with RVM you also need [virtualenvwrapper](http://www.doughellmann.com/articles/pythonmagazine/completely-different/2008-05-virtualenvwrapper/index.html).

If you have not set up Python on your Mac with virtualenv/virtualenvwrapper I highly recommend you do so.  I have [written a walkthrough](/blog/2012/01/22/rvm-for-python-setting-up-virtualenv-and-virtualenvwrapper-on-lion/) that updates the information available at the links already mentioned.

Once you have gotten exitwp and its dependencies installed, simply drag the xml file you exported from wordpress (under **Dashboard > Tools > Export**) into the *exitwp/wordpress-xml* folder.  Then run:

`python exitwp.py`

If you're lucky, that's all there is to it.  Your posts will be converted to markdown and saved to the *exitwp/build/jekyll/username.wordpress.com/_posts* folder.  But I got an error message from the XML parser.

Apparently this is common as Wordpress doesn't do the greatest job of formatting the XML.  This wasn't a big deal, though.  I just ran it through xmllint (which should be preinstalled in OS X) and fixed the two or three errors by hand.  If you have TextMate handy, just open it in there and run **Bundles > XML > Validate Syntax**.