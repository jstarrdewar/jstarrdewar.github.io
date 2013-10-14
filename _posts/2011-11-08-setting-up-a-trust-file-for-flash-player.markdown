---
author: jstarrdewar
date: '2011-11-08 15:07:01'
layout: post
slug: setting-up-a-trust-file-for-flash-player
status: publish
title: Setting Up a Trust File for Flash Player
comments: true
categories:
- Flash
---

Flash Player is only allowed to load certain assets from an external server.
Needless to say this can be inconvenient when you are testing locally, as you
will surely be peppered with *Security Sandbox Violation* errors. To get
around this limitation, you can set up a trust file. The trust file tells
Flash not to concern itself with the security of swfs running in the specified
folder on your hard drive.
<!-- more -->
We've had to do this for ages, but I still run across people who have never
heard about it.

There's actually a GUI that looks like it ought to be able to do this for you
here in Adobe's strange little web-based local settings manager thingy:


[Adobe Settings Manager](http://www.macromedia.com/support/documentation/en/flashplayer/help/settings_manager04.html)

However, I have found it doesn't like to save my settings. You might try it first
to see if it saves you the trouble of going through the steps below.

Here's how you make a trust file manually (these instructions are for the Mac):

Find the folder at the following path:

`~/Library/Preferences/Macromedia/Flash Player/#Security/FlashPlayerTrust`

If any folder in that path doesn't exist you can create it. Using a plain text
editor, like TextMate, make a new file. Inside that file, write the path for
the trust file. For example:

`/Users/username/Documents/Projects/`

Then save it with an arbitrary name like "MyTrustFile**.cfg**" The important part,
obviously, is the .cfg extension.

I have also seen developers who just set their trust file to trust everything
on their hard drive. That's really asking for trouble. Presumably, all swfs
are not automatically trusted for a reason!