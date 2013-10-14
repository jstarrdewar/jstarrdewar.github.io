---
layout: post
title: "The Most Valuable Checkbox in DVD Studio Pro"
date: 2012-02-27 22:09
comments: true
categories:
- Apple
- DVD Studio Pro
---

This has happened to me over and over again: it's the last minute of a busy day.  We're rushing to burn a DVD to send to a client.  All the footage has been compressed.  Everything is perfect.  The DVD looks good in the simulator.  Let's burn this thing!  Hit burn.  DVD Studio Pro thinks for a while and then fails.  "Muxing Error" it says.  Sadness and despair prevails.

Fortunately, there is one checkbox hidden in the preferences that usually fixes this error and sends us on our merry way home.

![Screenshot](http://documentation.apple.com/en/dvdstudiopro/usermanual/Art/S02/S0251_TrackPrefs.png)

`Preferences > Track > Fix invalid markers on build`

Check that, hit burn again, and you're done.  Now you may ask why this checkbox is not checked by default.  The reason is that it can screw up the position of your markers.  Here is the explanation from Apple's documentation (page 397):

>When you place markers in the Track Editor with a video clip already present, the markers are automatically placed at GOP boundaries. If you move a marker, it jumps from one GOP boundary to the next, and therefore is always in a legal position.
If you move the video clip—for example, by trimming its start or dragging it to another position when multiple clips are in the V1 stream—the markers do not reposition to follow the video. There is also a good chance that at least some of the markers will no longer be at GOP boundaries. For this reason, you should be sure the video is in its final location before adding markers to it.

>When you build your project, DVD Studio Pro verifies that all markers are on GOP boundaries, and that none are placed after the end of the V1 stream’s video. A setting in the Track pane in DVD Studio Pro Preferences determines whether the build will quit if invalid markers are found, or if it will reposition markers to a GOP boundary and remove excess markers from the end of the track and continue with the build. See Track Preferences for more information.

Apple is concerned that you may find yourself missing a marker at the end of the video (since it would be deleted as excess), and you would get no error message, so they erred on the side of caution here.  However, I haven't run into this problem myself.  For a quick client review DVD you are going to be fine.  If you're making a master for DVD production you should definitely check your markers carefully since they could have been pushed forward in time by a GOP-length (GOP stands for "Group of Pictures" and GOP boundaries are typically about half a second apart).