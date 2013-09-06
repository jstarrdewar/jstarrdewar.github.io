---
layout: post
title: "The Promise of a Retina VR Display"
date: 2013-01-26 21:52
comments: true
categories:
- Virtual Reality
---

By the end of the decade, products like the [Oculus Rift Head-Mounted Display](http://www.oculusvr.com) could breathe new life into the PC business.  I say this because I see great potential in the device for a whole new kind of computing experience.  I think its utility could go far beyond games: it could replace our existing screens and monitors for day-to-day computing.

<!--more-->

I’m not alone in imagining this future.  In fact, I recently found out about a proof-of-concept called Ibex that you can run on your Mac or Linux machine.  You can download it here: <http://hwahba.com/ibex/>

The developer, Hesham Wahba, has ideas about this very similar to mine.  I think that one of the big advantages of this would be to be able to set a “desktop” that’s actually a fully 3D environment of some sort.  I think that would be far more pleasant than the current experience of sitting in a cubicle or bedroom all day.  Imagine an alpine meadow or a tropical beach.  I personally would like to spend my workday in Rivendell.

Since I live in Southern California, I often work outdoors on my laptop, but it creates a lot of additional eyestrain.  The light-levels outside are very high, and sunglasses interfere with being able to see the screen very well.  It’s workable, but not ideal.  Indoors during the day I face similar problems.  The way my iMac is situated it tends to catch a reflection of the kitchen window in the glass.  Drawing the blinds is simply depressing.

If you’re using a HMD, no matter where you are or what time of day it is you could potentially block out all the sources of light that might be distracting or tiring.  Another possible advantage would be that in real life, the monitor sits only a foot or two in front of you, requiring that you focus at near distance.  This is tiring and ruins your eyesight.  In a HMD, the focus is set at infinity, so you’re looking off into the distance all the time.<sup>1</sup>

In [an in-depth interview with Ben Lang at Road to Virtual Reality](http://www.roadtovr.com/2012/09/24/ibex-virtual-reality-desktop-environment-oculus-rift-1325), Hesham explained another possible advantage:

“Virtual reality desktops can in the short term increase the working space that we have so that, instead of needing the space for a 30″ monitor a few of them and the associated costs, you can create virtual workspaces at whatever size you need and lay them out however you want while hopefully still comfortably working with them. If one is flying on a plane, for example, using something like the Leap Motion and the Rift, you can end up working on many much larger screens just as you’re used to at home without being constrained by the tiny laptop screen you have.”

I think that would be just great.  My 15” MacBook Pro does not really afford enough space to work comfortably.  I like using my 27” iMac much better, but even that is often not enough.  Part of the problem is that we are constrained to rectangular screen spaces.  If applications are not optimized for full-screen use, the windows often become quite crowded and don’t seem to make efficient use of space.

Ibex doesn’t solve this problem (at least not yet) because it works by rendering the main screen drawn by the OS onto a 3D plane inside the environment.  Therefore, all of the windows are still constrained to the bounds of a virtual monitor.  It would be better if the windows themselves were added rather than the entire desktop environment.  I suspect this can be done.  It would work just like unity mode in Parallels or Fusion.  But given how clunky those can be, I think we won’t really achieve an optimum result without a fully customized window manager.

Then next problem is resolution.  If you play with Ibex, you’ll see that it’s totally inadequate.  At 3840x2400, the body text of this blog is quite readable, but optical distortion makes the menu bar, shortcuts and tab titles quite difficult. At 1920x1200, I could barely read the body text.  The Oculus Rift dev kit’s resolution is only 1280x800, and that’s divided between two eyes (640x800).  Then you have to subtract even more resolution due to optical distortion.  Here's what it looks like (click for full-size):

<a href="https://s3.amazonaws.com/jstarrdewar.com.bucket/Ibex_blog.jpg" style="white-space: normal">
![Ibex Blog](https://s3.amazonaws.com/jstarrdewar.com.bucket/Ibex_blog.jpg)
</a>

Here it is at 3840x2400 (this is roughly the resolution of the sci-fi goggles in _Snow Crash_):

<a href="https://s3.amazonaws.com/jstarrdewar.com.bucket/Ibex_3840x2400.jpg" style="white-space: normal">
![Ibex Blog](https://s3.amazonaws.com/jstarrdewar.com.bucket/Ibex_blog.jpg)
</a>

Meanwhile, I’ve become spoiled by my laptop’s retina display.  By the time the Oculus headset comes to market, I believe most if not all of Apple’s computers will feature retina displays.  Surely the lineup will have changed over completely by Christmas 2014.  For an HMD-based work environment to really offer an advantage over monitors, it will have to offer resolution to match.  Unfortunately that’s a much bigger challenge than you might realize.  Since the Oculus has such a wide field of view, the necessary resolution is truly staggering.

Here's some quick and dirty math to determine just how much you need. The 27” monitor on my desk at the distance I’m sitting has a field of view of roughly 45 degrees.  To achieve an acceptable retina resolution, I think Apple will have to up the screen to 3840x2400.  Let’s say a theoretical retina Oculus headset has a FOV of 120 degrees.  To match the retina iMac, the screen would need 10,240 pixels horizontally.<sup>2</sup>

Unfortunately, this will probably still look worse, because the image is divided into a stereo pair.  So to really look excellent, the screen has to be 20,480 pixels wide!  Assuming that the FOV on the headset is the same vertically as horizontally, the screen would need to be 10,240 pixels tall (it isn’t divided vertically, so you could pixel-double vertically to reduce strain on the GPU).

That means a retina iMac would need to push “only” 9,216,000 pixels, while a computer hooked up to a retina Oculus device would need to push 209,715,200.  Since lag is a major issue for the user experience in VR, it has to push those pixels at 60 frames per second.  In other words, you’ll need a really serious graphics card with a ton of VRAM, as well as a heavy-duty CPU and lots of system RAM to handle all the high-resolution graphics.

Therefore, if widespread demand was kindled for a product like this, there would be a corresponding resurgence in demand for the latest and greatest in processing power, and big towers to hold all of that muscle.  That’s why I say it could breathe new life into the PC business, which is currently losing to the mobile world’s demand for low-wattage chips.  It seems like just the thing Intel would like to see happen, given their current leadership in big iron.

Could you build a screen like that?  A 7” screen at that resolution would require a dot pitch of 6.1 μm.  The highest-resolution full-color display available today has a pixel density of 9.4 μm: <http://www.microoled.net/news/news-from-microoled> (second entry).  It’s an OLED that squeezes a resolution of 1280x1024 into only .61 inches.  It's also available with a pixel density of 4.7 μm as a monochrome display (perfect for dogs, I guess).  We're almost there already.

However, it seems to me that the only thing that can generate enough demand to warrant scaling that screen up to 7” is a head-mounted display like the Oculus.  It would be a complete waste of resources to build an iPhone with a screen 10 times sharper than the current retina display (for that matter, it’s already getting silly with the rash of 440ppi screens coming to market this spring - you can't discern pixels beyond about 300ppi).  So we are faced with a chicken-and-egg problem.

The first-generation Oculus doesn’t need to get anywhere near retina resolution to be successful as a gaming device.  It’s much harder to discern pixels when there is a lot of motion in a scene.  If you show a trained eye a 480p video of an action scene, it will take a few moments before they realize you’re lying to them about it being 1080p.  The average person will take much longer.  I see people who paid for fancy HDTV’s and fancy HD cable service happily watching HBO in standard definition without realizing their mistake (it drives me nuts: “switch to the 900’s!”).  It’s only when the action stops and there is a lot of textual information on screen that the difference becomes apparent.

From everything we've heard thus far, the consumer version will likely ship with a 1080p screen (although [this 6.1-inch, 500ppi, 2560x1600 display](http://www.smartkeitai.com/sharp-6-1-inch-wqxga-2560x1600-igzo-smartphone-display-prototype-eyes-on-at-ces-2013-video/) from Sharp would be sweet).  I foresee mobile device screens getting up to the 600ppi range before the resolution arms race ends.  After that, it’s really up to the nascent HMD market (which, don’t forget, includes Google Glass) to drive demand for even higher pixel density.

For now, we’ll have to stick with games, but (_if_ the Oculus and/or Google Glass create enough demand) ten years from now the graphics power and displays needed for retina-level virtual-reality are likely to be priced within reach of consumers.  Power users – the type who would drop $1000-2000 on a 30” display today – probably won’t have to wait that long.  The virtual workspace technology will probably be useable within the next three to five years.<sup>3</sup>  Hopefully with projects like Ibex, we’ll be ready when that day comes.

---

<sup>1.</sup> Not having used the device yet, I can’t say whether there would be problems with your brain expecting to need to refocus on objects at different distances.  It’s probable that won't be an issue because in very bright environments, your eyes have a very deep depth of field.

<sup>2.</sup> Roger Clark [calculated on his site](http://www.clarkvision.com/articles/human-eye/index.html) that the actual resolution of the human eye at a 120-degree FOV is 24000x24000 pixels.  My calculations are not as scientific as his since they're based on what Apple defines as 'retina' resolution for its laptop displays. There are a number of printers on the market capable of 4800x2400 dpi.  It would be an interesting experiment to create some prints and put them in a VR housing to see if that was sufficiently high resolution.

<sup>3.</sup> I’m thinking a resolution of 10240x5120 gives us the same virtual screen dot-pitch that we’re currently accustomed to, and 10240x10240 might give us a nice middle ground.  Improving just the vertical resolution would make a noticeable difference, and it isn't uncommon.  The current version of the Oculus certainly takes advantage of all the vertical resolution it can, and movies shot on anamorphic lenses also have more resolution vertically than horizontally.