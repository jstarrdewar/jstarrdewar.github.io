---
layout: post
title: "Use UglifyJS To Automatically Strip console.log() From Your Production JavaScript"
date: 2013-02-28 23:52
comments: true
categories: 
- JavaScript
---

Oftentimes, you want to include a lot of `console.log()` statements while you are developing your app.  Most of these will be removed before deployment, but it isn't always convenient to remove all of them.  There are useful messages that illuminate what's happening, like log statements in AJAX responses and module initializations.  If you remove them all and a bug is discovered in your production code, you'll have to go and put them back in – that's not staying very DRY.

Of course, you could just leave the `console.log` statements in the code.  There are two problems with that. The first problem is Internet Explorer.  In IE 8, `console` is only defined when the Developer Tools panel is open.  (That just seems like a cruel trick; you won't see any errors caused by missing `console` objects when you open the dev tools to find out why your code doesn't work.)  You can get around that by including your own `console` shim.  One is included in HTML5 Boilerplate.  

That brings us to problem #2.  There is a performance cost to having the browser catching log events.  Usually this won't really make any appreciable difference, unless you have a log message in a big loop somewhere, but it's something to be aware of.

If you have a minification step, UglifyJS will afford you a better solution. The following technique is now pretty clearly documented in the UglifyJS ReadMe.  Yet perhaps because it was a bit confusing before, most people that I know weren't aware that you could do this.

The trick is that you can define constants while minifying.  For example, this command...

`uglifyjs --define DEBUG=false "main.js" > "main.min.js"`

...Adds a temporary constant called DEBUG that evaluates to false. So if in your code you write...

``` js
if (typeof DEBUG === 'undefined') DEBUG = true; // will be removed

function doSomethingCool() {
	DEBUG && console.log("something cool just happened"); // will be removed
}
```

...The log message line will be removed by Uglify's dead-code remover (since it will erase any conditional that will always evaluate to false).  So will that first conditional.  But when you are testing as uncompressed code, DEBUG will start out undefined, the first conditional will set it to true, and all your console.log() messages will work.

There is a new version of UglifyJS now called UglifyJS2.  Its behavior is a bit different.  In order to get the dead-code remover to work, you have to activate the compressor.  So the command is now:

`uglifyjs --compress --define DEBUG=false main.js -o main.min2.js`

_Related Posts:_

[Introducing Adhesive](/blog/2013/11/14/introducing-adhesive/)