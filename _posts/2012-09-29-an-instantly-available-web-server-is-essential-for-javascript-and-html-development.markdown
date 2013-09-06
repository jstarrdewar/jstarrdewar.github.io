---
layout: post
title: "An Instantly Available Web Server is Essential for JavaScript and HTML Development"
date: 2012-09-29 17:06
comments: true
categories:
- JavaScript
- HTML5
- Best Practices
---

When beginners first embark on an HTML project, they generally test their work by simply double-clicking the index.html file and opening it in a browser directly.  You can often get quite far into a project this way, and then comes the shock: you upload to a web server, and suddenly everything is broken.  Your images don't load and your links don't work.

This happens because links on the file system are relative to the file that tries to open them; on a web server, they are typically relative to the base URL instead.

That's not the only problem; typically callbacks from external services won't work, and neither will iFrames.  So your social media buttons will be broken too.

The solution to this is simple.  Always develop locally with a web server.  Macs have Apache installed by default and it's easy to install WAMP/MAMP/LAMP/XAMP and use that for your server.  Another major benefit to this is that you can connect to your computer from mobile device and test your changes with a simple save-and-reload.  It's far more efficient than pushing to FTP every time.  There's just one problem with the built-in Apache or LAMP-stack solution:

It's inconvenient.

On Mac OS X, you are restricted to placing all your projects in the sites folder without reconfiguring Apache, and MAMP Pro places the same restriction on you.  Moreover, as you move between projects, you have to point the webroot at different folders, which tends to be just time-consuming enough that it feels like a chore to be put off.  That, or you have to navigate to your project root in the browser, annoying on mobile devices.  Apache takes a long time to start up as well.  As a result, I still see inexperienced developers using the filesystem to test their apps, and encountering the same unexpected difficulties.

Stop doing that!  There's a better way. <!--more--> Chances are, Apache isn't the only web server built into your computer.  Python and Ruby come bundled on most machines, and they include their own web servers.  Here's the command to bring up the Python one:

``` sh
python -m SimpleHTTPServer
```

Do you enjoy clearing your cache every time you reload the page while you're developing an app?  If so, you're all set.  Otherwise, not so much, because SimpleHTTPServer has caching enabled by default.  A Google search for "non-caching simple web server" leads us to a [much better solution](http://chrismdp.com/2011/12/cache-busting-ruby-http-server/), courtesy of [Chris Parsons](http://chrismdp.com/workwithme.html).  (Chris credits [Pablo Marti](https://github.com/pmarti) for coming up with this).  For convenience' sake, I made a gist of this, embedded below:
{% gist 3805501 %}

[Click here](https://gist.github.com/gists/3805501/download) to download it as a file.  You can use this script directly by saving it in the directory you want to serve and issuing the following command:

`ruby http`

Or you can save it in `/bin` to make it universally available.  You'll need to make it executable for this to work.

``` sh
cd /bin
chmod +x http
```

Henceforth, all you have to do is drag the folder you want to serve onto Terminal.app's Dock icon and type `http`  It's instantaneous and convenient.  You'll never be tempted to do it the wrong way again.

**Update:**

A new, very convenient solution is now available in the form of [Yeoman](http://yeoman.io/)'s `yeoman server` command. (Versions prior to 1.0.  See update below)

If you have PHP 5.4 or later installed, you can use this command: `php -S localhost:8000` to launch the new built-in server.

**Update 2:**

The [latest WebStorm EAP release](http://blog.jetbrains.com/webide/2013/02/webstorm-6-eap-build-126-254/) contains a built-in web server that you can use on port 63342.

**Update 3:**

Yeoman has removed the `yeoman` command.  To run the server you now use `grunt server`.
