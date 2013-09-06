---
layout: post
title: "Input Box Tips, Part 1: Limiting the Number of Characters"
date: 2012-02-04 13:27
comments: true
description: "How to limit the number of characters in an html text input and/or an html textarea with JavaScript & jQuery."
categories:
- jQuery
- JavaScript
- HTML5
---

There are a couple of top ranked Google results regarding input boxes that I think are a little out of date.  Here's one of them, from 2009:

[Limit the Number of Characters in a Textarea or Text Field](http://www.mediacollege.com/internet/javascript/form/limit-characters.html). This tutorial shows you how to build a textfield with a character limit and a counter, similar to what you see on Twitter.

It shows two techniques for limiting character count.  Unfortunately, it glosses over the simpler of the two, which works for inputs: the [maxlength attribute](http://www.w3schools.com/tags/att_input_maxlength.asp).

So if all you want to do is make a text input that only accepts, say, four characters (for example if someone was entering a year), this is what you would do:

``` html
<input type="text" placeholder="YYYY" maxlength="4"/>
```

<div class="divider"></div>

Text areas are a tougher challenge because the `<textarea>` element doesn't have a maxlength attribute.  I don't like the solution in the article linked above because when you reach the limit, you see the last character you entered be deleted automatically.  It's not how most sites work, and I think having the text input simply not accept any more characters is more elegant and consistent with the behavior of `maxlength`. <!-- more -->

<div class="jsfiddle">
<iframe style="width: 100%; height: 772px" src="http://jsfiddle.net/jstarrdewar/ubp6r/embedded/" allowfullscreen="allowfullscreen" frameborder="0"></iframe>
</div>

The solution is to catch the `keydown` event before it reaches the textarea.  This is very easy to do with jQuery using `event.preventDefault()`, as you can see in the jsFiddle below, which shows how to create a Twitter-like text area limited to 140 characters or less.  We display the character count using `keyup` instead of `keydown`. Otherwise the count would get off by 1 when deleting text (because the keydown event fires before the textarea is updated).

There is a small problem, which is that _all_ keys will be ignored when the textfield is exactly 140 characters long.  This behavior is obviously not optimal.  Therefore, I added a switch case to whitelist certain keys.  Since nothing happens here, `break` is unnecessary until the last item in the whitelist.  The default case will be for any other key on the keyboard.  It stops event propogation.

With that issue solved, there is still the problem that when the user pastes information into the textbox, its length may exceed the limit.  I chose a simple approach to fixing this: just listen for the `paste` event, then trim the content's length to the limit.  There is a trick to this.  The paste event is fired before the content is added to the text area, so you won't get an accurate count and the trim won't work.  Here is a [plugin](http://www.mattbenton.net/2012/01/jquery-plugin-paste-events/) that solves this problem by giving you a `postpaste` event, or you could just use setTimeout directly.

 I usually prefer to use my favorite jQuery plugin: [doTimeout](http://benalman.com/projects/jquery-dotimeout-plugin/), but in this case it will take exactly the same amount of code as setTimeout, so I am using setTimeout below for the sake of simplicity.  In the code setting the delay to 0, i.e. `setTimeout(callback, 0)` would do the trick, since it will cause the code to execute on the next frame.  You don't have to think up an arbitrary delay for it to work, like 100ms, which I see a lot of people do.

 I've added a delay because I think it's a little better to set a longer delay, and display a "Too Long!" message to let the user know why their content was trimmed.  You might also choose not to trim the content, instead changing the counter to another color, like red, or displaying a warning after the character count.  That way, the user could edit the pasted content down in the textfield itself.  It's up to you, so I suggest experimenting in the jsFiddle to see what behavior you like best.

If jsFiddle is down, [here is a gist](https://gist.github.com/1742886) you can look at instead.

<div class="divider"></div>

In [Part 2](/blog/2012/02/08/input-box-tips-part-2/), I show you the proper way to select all of the characters in an input when you click on it to focus.