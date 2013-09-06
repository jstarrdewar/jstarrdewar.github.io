---
author: jstarrdewar
date: '2011-12-14 23:34:23'
layout: post
slug: easeljs-tweenjs-soundjs
status: publish
title: EaselJS, TweenJS, SoundJS
comments: true
categories:
- Canvas
- Flash
- HTML5
- JavaScript
---

Grant Skinner has been busy lately, and he has apparently been focusing his
efforts on HTML5!

The fruits of his labor are some interesting libraries:

[EaselJS](http://easeljs.com), a port of the Flash API to the Canvas Element;
[TweenJS](http://tweenjs.com), a tweening library that is meant to work more
like the TweenLite/GTween libraries from Flash than the more rudimentary
system we get from jQuery; and [SoundJS](http://soundjs.com), a sound manager for
HTML5's sound API.
<!-- more -->
The site has some cute demos, but you should really just jump to the good
stuff and check out [Pirates Love Daisies](http://www.pirateslovedaisies.com),
a quite fun tower-defense game made with these three libraries.

If you want to sit back, relax and see how it all works, Lee Brimelow posted a
short video tutorial here: [Introduction to EaselJS](http://gotoandlearn.com/play.php?id=152)

I'm not yet convinced that EaselJS is necessary; but I haven't had a lot of
experience with Canvas yet due to a lack of a suitable project to tackle it
with, so maybe if I had, I would be convinced. From my experience so far, I
think you could get along fine with the Canvas API, but EaselJS does make
Canvas a lot less intimidating for those of us who do a lot of Flash work.
It's similar in that sense to the [Sparrow Framework](http://www.sparrow-framework.org), which ports the Flash API to iOS. (And it bears mentioning
that Canvas is conceptually the iOS/OS X drawing API ported to JavaScript).

This isn't the first alternative API to be built for Canvas. There is also
John Resig's [Processing.js](http://ejohn.org/blog/processingjs/), which is
interestingly both a language parser for the processing language and a
JavaScript drawing API. It's superficially quite similar to the Flash API, and
thus the EaselJS API. And it was released in May of 2008! I haven't seen to
many people using it; perhaps EaselJS will have better luck (and given that a
lot of Flash guys are learning HTML5 these days, I'm quite sure it will).

As I said, I haven't spent a long time with the Canvas API, and that's because
every time I've been tempted to use it, I've been discouraged by performance
issues. Without GPU acceleration it's not very good, and on a mobile device,
it's terrible/unusable. Luckily, that situation is changing. iOS 5 brought GPU
acceleration for canvas along with it, and some of the Easel demos work just
as well on an iPhone 5 as on the computer.

TweenJS is something I've been wishing for and event spent a little bit of
time conceptualizing, thinking I might have time to build it myself. I haven't
been motivated to really pursue it because jQuery and CSS3 have been doing
fine for my animation needs so far in my HTML5 adventures, but there was a
project I was working on several months ago at Sabertooth that could have
really used it. At any rate they beat me to it, or good things come to those
who wait. I'm not sure which.

