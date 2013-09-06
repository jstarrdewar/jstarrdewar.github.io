---
author: jstarrdewar
date: '2011-10-28 00:59:35'
layout: post
slug: extend-jquery-draggable-to-work-with-isotope
status: publish
title: How to Extend jQuery UI's Draggable (and make it work with Isotope)
comments: true
categories:
- JavaScript
- jQuery
---

First of all, here is a nice write up concerning the general concepts of
extending jQuery UI widgets using the widget factory:

[http://bililite.com/blog/extending-jquery-ui-widgets/](http://bililite.com/blog/extending-jquery-ui-widgets/)

This is all well and good, but if you try to follow this approach with
Draggable you get an error message:

`Uncaught TypeError: Cannot read property 'options' of undefined`

Not finding an acceptable answer online anywhere, I sat down with the debugger
and went through line by line until I found the problem.<!-- more --> The issue was that the
extended widget could not find the data object.  I didn't investigate too
deeply but it appears to be a side effect of the initialization process and it
didn't look easy to fix within the design of Draggable.  However, an easy
solution did suggest itself, which is to manually create the 'draggable' data
object in your subclass, and assign the element to that data.  That makes it
available and it initializes normally when you call _create() on the
superclass.

``` javascript
_create: function () {
    this.element.data("draggable", this); // Fixes TypeError
    this._super('_create');
}
```
Here is a discussion of the subject on the jQuery forum. I posted my solution
at the bottom:

[http://forum.jquery.com/topic/extend-draggable-widget](http://forum.jquery.com/topic/extend-draggable-widget)

<div class="divider"></div>

The reason I went to all this trouble was I that I was implementing the
Isotope plugin for a project, and I wanted to be able to drag one of the items
out of the Isotope list. Because Isotope uses CSS3 transforms, and Firefox
doesn't consider the CSS3 transform when it returns element positions, the
draggable would jump unexpectedly on _mouseStart. Luckily, Isotope can
optionally store the calculated item positions in the element's data.

Here is the isotope site:
[http://isotope.metafizzy.co/](http://isotope.metafizzy.co/)  Isotope is an
updated version of jQuery Masonry:
[http://masonry.desandro.com/](http://masonry.desandro.com/)  They share a lot
of code but isotope adds more features and works much better.  In the end, I
abandoned using Isotope for this project anyway, because I needed more
detailed behavior, and extending Isotope to create what I wanted was more work
than recreating the functionality.  That said, Isotope is fairly easy to
extend.  I created a small extension without much difficulty.  So I'm sure it
will come in useful at some point down the road.

**Update:**<br/>
You _do not_ have use the following code anymore with recent Firefox versions.  If you would, however, like to see a jsFiddle with Isotope and Draggable working in concert, please take a look at this follow-up blog post:
<http://jstarrdewar.com/blog/2013/02/24/an-example-using-jquery-ui-draggable-with-metafizzys-isotope-plugin/>

[Here is a gist](https://gist.github.com/jstarrdewar/1321760#file-jsd-draggableisotopeatom-js) showing an extended version of jQuery UI Draggable for Firefox compatibility.