---
author: jstarrdewar
date: '2011-11-15 13:36:02'
layout: post
slug: the-joy-of-flashlog
status: publish
title: The Joy of flashlog.txt
comments: true
categories:
- Flash
---

This post is already a bit obsolete. I don't actually use Flashlog.txt anymore
in my own development. But it is still useful! Why? Well, in my own workflow
it has been replaced with the debugger in Flash Builder or IntelliJ. It's easy
to point the debugger at any web address that is hosting your debugging-
enabled swf and get read the traces in the console. Then if you wish to
inspect an object with the debugger, you are all set up and ready to go.

However, if you are fortunate enough to have someone on your team who is
wrangling assets or doing data entry into the backend, they may not know how
to use Flash Builder or IntelliJ's debugger. Moreover, you may not want to pay
for an IDE license for their machine. They'll need to be able to see the
traces to catch malformed XML or misnamed assets, or they'll be calling you
over all the time complaining that the app stopped working (as you most likely
won't have time to make a helpful error-handling UI for them). **flashlog.txt** to
the rescue!<!-- more --> Here's how to set it up:

Using TextMate or another text editor, create a new file. In that file, put
the following lines:

``` sh
TraceOutPutFileName=/Users/USERNAME/Library/Preferences/Macromedia/Flash Player/Logs/flashlog.txt
ErrorReportingEnable=1
TraceOutputFileEnable=1
MaxWarnings=100
```

Save this file in your home folder ( `~/` ) as `mm.cfg`

Now run a swf in the debug player. The flashlog.txt file should have been
created for you. If not, you can go through the path above and create the
missing folders/file.

You can read the flashlog.txt file in any text editor, but the preferred
application is Console, which you will find in your Utilities folder. When you
open flashlog.txt in Console, you can search and clear your traces, and the
log will scroll as new traces happen. Another good solution is to use the
command line (on windows, use cygwin) with the `tail` program. At the prompt,
enter:

`tail -f ~/Library/Preferences/Macromedia/Flash\ Player/Logs/flashlog.txt`

Sometimes it takes a while to start working. Restarting the computer helps.
Sometimes it still doesn't work after a restart, but it will eventually.
Perhaps you could try breaking your Master Collection DVDs in half, one at a time,
within view of the computer, until it starts working*. Of course, before you
take such drastic action, make sure that your swf has traces enabled (for
example, when you run the swf in Flash CS5, you see the traces in the output
window), and that the machine is running the debugger version of Flash Player
or the debugging Projector.

You can get the debugging Players/Projectors from this page: [http://www.adobe.com/support/flashplayer/downloads.html](http://www.adobe.com/support/flashplayer/downloads.html)

There are Flashlog and Flashtracer add-ons for Firefox that could replace
Console or tail for you. I haven't had good luck with them, finding that they
are a bit fiddly and occasionally stop working. There are also some AIR apps
with the same purpose and with the same results. Granted I haven't tested
these solutions in at least a year so you may get more mileage than I did.
Once you get flashlog.txt working in tail or Console, it should be quite reliable.
I've never had it stop working except when I install an Adobe App and it
decides to overwrite my Flash Player with whatever obsolete version it came bundled with.

*Attempt at humor. Don't actually break your discs.