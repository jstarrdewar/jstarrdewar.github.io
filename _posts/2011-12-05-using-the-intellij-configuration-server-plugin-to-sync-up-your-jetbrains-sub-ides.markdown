---
author: jstarrdewar
date: '2011-12-05 14:41:24'
layout: post
slug: using-the-intellij-configuration-server-plugin-to-sync-up-your-jetbrains-sub-ides
status: publish
title: Using the IntelliJ Configuration Server Plugin to sync up your JetBrains sub-IDEs
comments: true
categories:
- AppCode
- IDEs
- IntelliJ Idea
- RubyMine
---

There are a few good arguments to be made for using JetBrains' sub-IDEs
instead of using plugins for the mothership IntelliJ IDE:

1. Efficiency: fewer plugins are loaded, so the app uses less memory and starts up faster.
2. Ease of setup: Project setup is optimized in the sub-IDEs. For example, in RubyMine, you only have to choose a folder with a Rails project in it, whereas in IntelliJ you have to also set up an SDK environment and create a project file.
3. Stability: Occasionally an enhancement to IntelliJ will break a major plugin. 10.5 broke compatibility with the RubyMine plugin, because the plugin was slightly behind schedule, and the issue wasn't resolved for ten days.
4. Availability: Some IDE's aren't available as plugins.  For example: AppCode.
  
Of course there are downsides as well: you save some money by only using
IntelliJ if you plan on developing in many different languages. It would be
nice if JetBrains would offer an "everything bundle" with a price similar to
the IntelliJ license.

However, one would think that the biggest downside is that you have to do a
lot of work to keep the applications in sync with your color scheme choices
and keymap preferences. Thankfully, there is a native solution to this
problem!<!-- more --> You can download the IntelliJ Configuration Server Plugin from the
plugins repository.

The name may be misleading, but the description states rather more clearly
that the plugin can synchronize settings "between IntelliJ platform products",
that is, not just IntelliJ but RubyMine, AppCode, and so on. It will also
synchronize settings between multiple computers, which is handy if you use a
laptop as a secondary machine or want to bring work home.

To use the plugin you must first create an account here:

[http://account.jetbrains.com/Index.action](http://account.jetbrains.com/Index.action)

This account is not the same as the one you may be using for the YouTrack bug
reporter in the support section of their site.

Choose the IDE that has the settings you want to share among your other
products and computers and activate the plugin in that program first. I highly
recommend you backup your preferences first, because you do not really have
any control over how the plugin merges your settings.

For example, I had a customized theme in AppCode that I didn't want to be
overwritten so I copied it to the desktop. You can find the preference files
in ~/Library/Preferences/_appName_

Then activate the plugin in all of your remaining apps.

Overwriting the server with your local backup is a bit tricky. IntelliJ gives
priority to the versions held on the server, so simply dragging your
preference file into the preferences folder will do nothing. The preference
will be immediately overwritten by the server version again. In the case of
the color scheme, the secret is to go to the color scheme preference pane and
delete the scheme in question. That will delete it on the server. Then you can
drag the backed up color scheme into the colors folder in your preferences
library, restart the app, and reselect the color scheme. It will be uploaded
to the the server and then synced down to your other apps.

Otherwise, importing preferences normally should update the server. I'm not
sure why I like dragging the color theme XMLs around manually, but I do. I
guess it's a psychological phenomenon.

