---
layout: post
title: "Input Box Tips, Part 2: Select All on Focus"
date: 2012-02-08 12:05
description: "How to automatically select all text in an html input on click to focus with JavaScript & jQuery."
comments: true
categories:
- jQuery
- JavaScript
- HTML5
---

In [Part 1](/blog/2012/02/04/input-box-tips-part-1/), I showed how to limit the number of characters in a text input (easy) or a text area (somewhat more difficult.)  In this part, I'll address a common behavior in forms, which is for an input to select all of its contents automatically when you click or trigger a focus event on said input.

Here is the first Google result: [Select text in input box on user select or focus](http://jquery-howto.blogspot.com/2009/04/select-text-in-input-box-on-user-select.html).  To summarize: all you have to do is `$(input).select()` in your click handler.

Unfortunately, it's not quite that simple because calling `select()` doesn't work in every browser when the focus event is triggered by a mouse event.  The trouble is that the events are not fired in the same order on every browser.  Webkit happens to fire its mouseup event after the focus event, and that causes the text to highlight and instantly de-highlight again.  Result?  No selection.  <!-- more -->

Shane Tomlinson figured this out and came up with a [proper solution](http://www.shanetomlinson.com/2009/input-textarea-select-on-click/) to the problem.  But I don't like his solution because it takes too much code (21 lines, without the comments).  My preferred method is his original idea: add a setTimeout to knock the select() call onto the next frame, after all the events have finished firing.  No delay is necessary.

<div class="jsfiddle">
<iframe style="width: 100%; height: "100px" src="http://jsfiddle.net/jstarrdewar/bJAmx/embedded/" allowfullscreen="allowfullscreen" frameborder="0"></iframe>
</div>

It's just 4 tiny little lines of code and it works in all the browsers I tested (IE8, 9, Safari, Chrome, & Firefox).  If jsFiddle is down, [here is a gist](https://gist.github.com/1772965) you can look at instead.

---

You may be wondering about line 2.  The reason I created the `input` variable is that `this` will refer to a different scope inside setTimeout's callback.  So we need to store a reference to `this` (which in a jQuery callback references the wrapped DOM object) that we can access from the callback.

Of course we could always just put `$("#example").select()` inside the setTimeout callback, but I make it a rule never to duplicate jQuery selectors.  For one thing it's faster; you are not querying for the element twice (but you won't see any difference in this case; it would make a difference if the code was running many times in a loop of some kind).

My primary reason for sticking to this rule is that it is always challenging to keep one's jQuery selectors in sync with the CSS.  When you rename something in the CSS, you might inadvertently break your JavaScript.  You then will have to search and replace for all your corresponding jQuery selectors.  It's a pain, and sometimes you miss one and wind up with a confusing bug.

To further mitigate this issue, I try to use jQuery with id's as exclusively as possible and avoid using id's in the CSS altogether.  This leads to some duplication of effort in your HTML, but it's generally less onerous than excessive coupling between my JavaScript and CSS.