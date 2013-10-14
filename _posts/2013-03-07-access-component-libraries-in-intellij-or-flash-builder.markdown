---
layout: post
title: "Access Component Libraries in IntelliJ IDEA or Flash Builder"
date: 2013-03-07 12:36
comments: true
categories: 
- Flash
- DoubleClick Studio
---

If you find yourself stuck writing a complicated Flash Banner, you will run into a minor inconvenience: most of the ad networks package their api up into .mxp components.  You load them into Flash via the Adobe Extension Manager.  

That means that if you wish to use IntelliJ IDEA or Flash Builder to edit your code, you have to put up with them complaining about missing classes and a lack of code completion.  Or does it?

An .mxp file for Flash is just a collection of swcs and/or as3 files.  When the .mxp file is installed, Extension Manager copies those files into your Application Support folder.  

The folder locations for various platforms are mentioned in this [Adobe Support Document](http://help.adobe.com/en_US/flash/cs/extend/WS5b3ccc516d4fbf351e63e3d118a9024f3f-7fe8.html):

__Mac OS X:__<br/>
`~/Library/Application Support/Adobe/Flash CC/language/Configuration/Components/`

__Windows 7:__<br/>
`C:\Users\USERNAME\AppData\Local\Adobe\Flash CC\language\Configuration\Components\`

__Windows Vista:__<br/>
`C:\Users\USERNAME\Local Settings\Application Data\Adobe\Flash CC\language\Configuration\Components\`

__Windows XP:__<br/>
`C:\Documents and Settings\USERNAME\Local Settings\Application Data\Adobe\Flash CC\language\Configuration\Components\`


Thanks to [Jarrod Cope over in the Google Product Forums](http://productforums.google.com/forum/#!topic/doubleclick-rich-media/g_edWvoFP40) and "bvb" down in the comments on this page, for letting me know the locations on OS X and Windows before I was able to find that support document!

Just add the library to your IDE of choice, et voilà!  Here is a screenshot of the DoubleClick Studio swc files loaded into IntelliJ:

<p class="fullWidthImage">
	<img src="/assets/images/2013_03_07/intellij_project_structure_doubleclick_swc.gif">
</p>

Success!

<p class="fullWidthImage">
	<img src="/assets/images/2013_03_07/doubleclick_swc_success.gif">
</p>