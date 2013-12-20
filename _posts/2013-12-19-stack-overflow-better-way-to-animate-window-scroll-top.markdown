---
layout: post
title: 'A better answer for: "Is it possible to animate scrollTop with jQuery?"'
date: 2013-12-19 22:58
comments: false
so: http://stackoverflow.com/a/20699124/1084434
categories:
- Stack Overflow
---

My answer to a question on Stack Overflow: [{{ page.so }}]({{ page.so }})

I found that the generally accepted solution of writing `$('html, body').animate({scrollTop: 100px})` led to unexpected results when using the `step` callback.