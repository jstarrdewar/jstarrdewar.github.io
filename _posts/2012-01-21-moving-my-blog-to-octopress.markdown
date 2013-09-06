---
layout: post
title: "I'm Moving My Blog to Octopress"
date: 2012-01-21 21:02
comments: true
categories:
- Ruby
- Heroku
---

After writing my first 19 posts on Wordpress.com I realized that it really doesn't fit the requirements of a technical blog.  You can pony up $99/year for a professional account that includes a few more plugins and the ability to edit your site's CSS, and I planned to do that eventually.  But there is currently no way to include gists from Github, which is something I really wanted to do, because of the obvious concerns Wordpress has with embedding JavaScript in posts.

I was also dissatisfied with the results of the pre and code tags.  So I started researching web hosts for a custom installation.  Given that this blog doesn't have a huge number of readers thus far, I didn't really want to part with the cash, and choosing a hosting provider is surprisingly difficult!  They all have really smarmy, off-putting homepages with low introductory rates.  If you Google any variation of "best hosting providers" they have clevery filled the first several pages of results with puppet blogs where unattributed mystery men have praised their product in the guise of unbiased reviews.  And many of the companies have multiple brand names and sites.  It's a really icky corner of the internet.

It occurred to me that the development level of Heroku would easily contain the little bit of traffic I get.  I love Heroku and have been using it since its initial public beta.  If I could host my blog on Heroku, I thought, then if ever I struck gold and the hits started pouring in by the millions, I could just add more Dynos.  It seemed like a great idea.

<!-- more -->

As it turns out many other Ruby developers have had the same idea, and there are a number of projects on Github geared towards building simple blogs for publishing via git either through Heroku or Github:Pages.  The most well-known of these is Jekyll.  I've looked into Jekyll before and it seemed fairly straightfoward, but there is a lot of documentation to go through and it looked like a lot of customization would be required, and I don't have a lot of time to devote to my blog.

A little more searching brought me to Octopress, which wraps Jekyll in a friendly little interface and has great defaults geared towards a technical blog!  It also has plugins for code snippets and gists, and already includes Google Analytics tracking and a commenting solution through Disqus.  It really seems perfect for my purposes.

So here we are, with a new blog running on Heroku!  I'll be replacing all of the posts currently on Wordpress.com to their equivalents here.  My web address has changed from http://jstarrdewar.wordpress.com to just http://jstarrdewar.com.  http://www.johnstarrdewar.com will also redirect here.