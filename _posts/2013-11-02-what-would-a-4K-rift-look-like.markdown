---
author: jstarrdewar
date: '2013-11-02 04:56:10'
layout: post
title: What Would a 4K Rift Look Like?
comments: true
---

I’ve been stewing on the idea of a retina VR display, and I got interested in finding out what it would look like, and where the optics of the Oculus Rift become a limiting factor.

I had an idea: I can’t get ahold of a super-high resolution display, but my printer is certainly capable of producing much sharper images than the current Rift.  So I decided to try printing out a high resolution rendering to see if I could make my own retina Rift.

I used modo for the render, with a sample scene from the object library.  I used the standard 3D camera mode with barrel distortion and a 115-degree FOV, which is what I normally see in the Rift with my C cups.  The distortion in modo is not quite the same as the correction that the Oculus SDK provides, but it’s close enough to work for this experiment.  I incorporated a screenshot of this blog taken while operating in retina mode (this was back before the redesign).

Getting the images to line up properly was a bit of a challenge.  First I rendered at 1280x800 and used fullscreen mode in Photoshop to preview it on the Rift.  I created guides in photoshop 64mm apart and centered each side of the image over them.  By default, modo will put the images fully side-by-side, but to create an image for the Rift, you need to cut some of the area out of both images between the eyes.  Interestingly, my eyes are 66mm apart but when I tried putting the image centers 66mm apart rather than 64mm, I could not resolve a 3D image, even after adjusting the camera separation in modo as well.

{% picture modo_rift_render.jpg %}

I rendered the image at 12800x8000 pixels, which works out to about 2171 ppi at the size of the Oculus display.  I figured that would be approximately retina quality, since the screenshot was at about the same resolution in the center of the image.

Unfortunately, that high resolution was too high for my printer.  It maxes out at only 600 dpi.  Even at that resolution, it turns out, the real resolution limit is the grain of the paper.  Still, that’s about 2500 dots across, so very nearly a simulation of a 4K display.  I carried on.  If you happen to have a printer capable of a much higher resolution and want to follow along, you can [download the full-sized 12.8K image here](https://s3.amazonaws.com/jstarrdewar.com.bucket/rift_retina_test_huge.jpg) and follow along.

Next, I needed to take a look at my creation through the C cups.  My first idea was to try stuffing the print through the hole where the cups attach and using a plain white background as a backlight.  This worked OK, but the screen door was apparent and made it difficult to see any additional resolution.  The other problem was that once I cut the print in half, I had a terrible time getting it lined up properly again.

{% picture rift_print_inside.jpg %}

I decided my next approach would be to make a cardboard Rift.  I sacrificed a nearly empty box of checks to the cause.  The problem with this approach was that I could not get adequate light into the box and it was too hard to see.

{% picture cardboard_oculus.jpg %}

Finally I resorted to just holding the eyecups above the print, one in each hand.  I had to hold really still but at last I was able to reach some conclusions.

{% picture through_the_looking_glass.jpg %}

It looks like a 600 ppi display is really about the limit of the eye cup lens optics that came with the dev kit.  Obviously I’m not correcting for chromatic aberration but I don’t think it would be possible to correct for the amount of smearing that occurs around the edge of the frame, something that you really don’t notice in the current rift.

The result is that the block of text in the center of the “screen” is quite legible — impressive considering how _illegible_ text on the current headset can be — but the list of recent posts could only be read when hovering directly over it with the eye cup.

I had a chance to ask Palmer Luckey about this directly and he said that the general optical configuration of the rift can avoid this edge smearing effect all the way up to retina resolutions.  However, the optics have to made with that resolution in mind.  Oculus now has experts on staff who know how to make these kinds of specific optimizations.  However, we shouldn't expect the optics to be optimized for resolutions higher than the screen.  The sharper the screen, the more expensive the lenses get.

Palmer also said that the optics on the upcoming 1080p rift will be considerably better than on the current rift.  In my ten-minute experience with the 1080p rift samples that have been making the rounds lately (and use the current optics) I wasn't able to discern any major shortcomings.  However I know that with my personal dev kit, I do notice some issues if I go looking for them, especially because my eyes are not exactly 64mm apart which means I can only get the image at optimal clarity in one eye or the other.

(I know about the [IPD Adjuster from VR-Gear](http://www.shapeways.com/shops/vrgear), but I use the C cups so I need to find another solution).

_Related Posts:_

[The Promise of a Retina VR Display](/blog/2013/01/26/the-promise-of-a-retina-vr-display/)

[Motion Tracking Goes a Long Way Towards Eliminating VR Sickness](/blog/2013/10/23/motion-tracking-goes-a-long-way-towards-eliminating-vr-sickness/)