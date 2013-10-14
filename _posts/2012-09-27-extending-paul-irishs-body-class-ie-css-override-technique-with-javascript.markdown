---
layout: post
title: "Extending Paul Irish's body-class IE CSS override technique with JavaScript"
date: 2012-09-27 15:59
comments: true
categories:
- JavaScript
- HTML5
- CSS
---

I think as web developers we're all pretty familiar with this block of code, or something like it:

``` html
<link rel="stylesheet" type="text/css" media="screen" href="css/style.css" />
<!--[if IE 8]><link rel="stylesheet" type="text/css" media="screen" href="css/ie8.css"  />< ![endif]-->
<!--[if IE 7]><link rel="stylesheet" type="text/css" media="screen" href="css/ie7.css"  />< ![endif]-->
<!--[if IE 6]><link rel="stylesheet" type="text/css" media="screen" href="css/ie6.css"  />< ![endif]-->
```

When I see this I get depressed.  It just feels like so much work to keep all the overridden classes straight, especially with the oldIE's terrible dev tools.  Paul Irish and HTML5 Boilerplate have since popularized a [technique that I greatly prefer](http://paulirish.com/2008/conditional-stylesheets-vs-css-hacks-answer-neither/): rather than having the overridden styles in a separate stylesheet, you can place them right below the original declaration.  It requires a lot less mental overhead to keep track of your overrides this way.

Here's what the code block above looks like in HTML5 Boilerplate:

``` html
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
```

Here's how it's used on this site:

``` css
.lt-ie9 body > header h1 {
  font-family: "Open Sans";
}

.lt-ie9 aside.sidebar {
  padding-left: 40px;
  width: 240px;
}

.lt-ie9 body > nav {
  padding-right: 24px;
}
```

You can also use this technique with JavaScript to do a lot of useful things.  I've found a few which I'll share with you.

Now were you wondering about `no-js`?  This is a simple example of using JavaScript to control overrides.  The Modernizr library, very common on the web these days, provides this to give you a way of styling your page especially for people who have disabled JavaScript.  When Modernizr loads, it will remove the `no-js` class.  You could use this knowledge to show a message telling your users that JavaScript isn't optional on your site, for example, using only css.

What else can we do?  Well a problem I have run into while developing responsive web sites is that many Android phones won't trigger the mobile layout.  The problem varies from phone to phone but I think it's generally caused by the phone attempting to masquerade as a much larger screen than it actually is.  For example, a certain HTC phone was reporting its screen size as 1280x720, so my media query was ignoring it.  Result?  The menu was too small to be usable.  The solution?  Fall back on [user-agent detection](http://detectmobilebrowser.com/).  However, I still wanted to keep the CSS simple and not build out a separate css file for mobile, so I used the UA detection to add a `mobile` class to the html tag:

``` js
// Using jQuery version of script from http://detectmobilebrowser.com
if ($.browser.mobile) {
    $('html').addClass('mobile');
}
```

``` css
#menu {
  font-size: 1em;
}

.mobile #menu {
  font-size: 2em;
}
```

Another useful idea I had was to create an override to support retina displays.  Detecting a retina display with JavaScript is easy!

``` js
if (window.devicePixelRatio > 1) {
    $('html').addClass('retina');
}
```

``` css
#profile {
  background-image: url(profile_1x.jpg);
  background-size: 50px 50px;
}

.retina #profile {
  background-image: url(profile_2x.jpg);
}
```

I was worried that the browser would try to load all the 1x assets before trying to load the 2x assets, but I found that the JS ran fast enough to outpace the browser, and it only attempted to load the 2x assets.  So this is a pretty elegant solution, in my book.

As an aside, in iOS 6, there's a new webkit prefix that does retina detection for you: `-webkit-image-set(url(img_1x.png) 1x, url(img_2x.jpg) 2x)`

Since only Apple products currently have retina displays, this might work in the near term, but with Windows 8 support for 2x resolution screens, and the new Nook HD having a retina resolution, those days are numbered.

I hope that this inspires you!  It seems the possibilities are endless, and using overrides hopefully keeps your css nice and readable.
