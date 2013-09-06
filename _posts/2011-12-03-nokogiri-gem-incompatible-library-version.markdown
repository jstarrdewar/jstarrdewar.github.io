---
author: jstarrdewar
date: '2011-12-03 22:45:17'
layout: post
slug: nokogiri-gem-incompatible-library-version
status: publish
title: 'Nokogiri gem: Incompatible library version'
comments: true
categories:
- Ruby
---

Ran into this error today:

`Incompatible library version: nokogiri.bundle requires version 8.0.0 or later, but libiconv.2.dylib provides version 7.0.0`

Fortunately, uninstalling the nokogiri gem and reinstalling it solved the
problem. Easy fix, thanks to this [StackOverflow question (and answer)](http://stackoverflow.com/questions/5714117/rspec-errors-missing-libraries-after-installing-homebrew-and-uninstalling-macpo).

I think it may have been caused by the same trigger, in that I recently
migrated from MacPorts to homebrew on this system after having repeated
conflicts between Lion's built in PostgreSQL and the `port` install.