---
author: jstarrdewar
date: '2012-01-06 14:37:09'
layout: post
slug: logout-facebook-users-without-javascript-sdk
status: publish
title: Logout Facebook Users without using an SDK or JavaScript
comments: true
categories:
- Facebook
- Ruby
- Ruby on Rails
---

Facebook's documentation does not explain how you can log users out of their
service without using their PHP or JavaScript SDKs. Funny thing is that when I
googled for an answer I found a lot of negativity and people claiming it
wasn't possible. Well, clearly it's possible; how would the PHP or JavaScript
SDK's accomplish it without an endpoint?

As it turns out, it's really easy. Just add a link to the following url:

`https://www.facebook.com/logout.php?access_token=ACCESS_TOKEN&confirm=1&next=REDIRECT`

replace `ACCESS_TOKEN` with your temporary access token (that you got from
OAuth) and `REDIRECT` with the full url of wherever you want to redirect to
after logout, for example:

`https://www.facebook.com/logout.php?access_token=1234567890&confirm=1&next=http://jstarrdewar.com`

You just need to watch out because Facebook apparently changes their logout
technique from time to time, hence the confusion. You need to be wary of
breaking changes. To get the latest version, you could clone the PHP SDK and
see what format is returned by this method:
[getLogoutUrl](http://developers.facebook.com/docs/reference/php/facebook-getLogoutUrl/)
