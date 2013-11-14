---
author: jstarrdewar
date: '2013-11-14 08:16:12'
layout: post
title: Introducing Adhesive
comments: true
---

{% picture adhesive.jpg %}

I have just pushed version 1.0 of my minimalist JavaScript build tool, [adhesive](https://github.com/jstarrdewar/adhesive).  I&nbsp;originally created adhesive well over a year ago to support my World of the Borgias project, and released the initial version on npm about 8 months ago.

Adhesive's raison d'être is that I often find myself inheriting projects that simply list their javascript dependencies as script tags in the head or body element.  I wanted a quick and easy way to build a concatenated, minified file to replace the tag soup and improve page loading performance.  I also wanted a tool that supported source maps so that I could easily debug the combined JavaScript.  Nowadays, Grunt provides a very robust solution, but its power and extensibility could be overkill — I needed something that wouldn't intimidate junior programmers.

Adhesive also provides support for using Uglify to strip console.log statements from the minified script with global definitions [as described in this post](http://jstarrdewar.com/blog/2013/02/28/use-uglify-to-automatically-strip-debug-messages-from-your-javascript/).

To install adhesive, make sure you have Node.js installed, then run:

`npm install -g adhesive`.

You must provide a JSON configuration file, which I recommend naming `build.json`

 ```json
 {
     "sourceRoot":"src",
     "sources":[
         "vendor/swipe.js",
         "vendor/PxLoader.js",
         "vendor/PxLoaderImage.js",
         "main.js"
     ],
     "outputPath":"js/main_built.js"
 }
 ```

 After that it's easy.  Passing the `--debug` flag generates a source map as well:

 `adhesive build --debug`

You can find out more about the project by viewing the README on [Github](https://github.com/jstarrdewar/adhesive) or [npm](https://npmjs.org/package/adhesive).