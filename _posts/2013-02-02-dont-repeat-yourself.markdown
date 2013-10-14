---
layout: post
title: "Don't Repeat Yourself"
date: 2013-02-02 23:52
comments: true
categories: 
- Best Practices
---

One of the most important tenets of computer programming is the DRY principle. “DRY” stands for “Don’t Repeat Yourself” and it’s a very powerful concept once mastered.  Avoiding repetition in code is critical to the goal of eliminating errors from the system and making it easy to maintain.  If the same lines of code are repeated throughout an application, when the system needs to be changed, all of those copies will have to be updated.  It’s often in this updating process when a small mistake or typo creeps in that will take many hair-rending hours to find later on.

For programmers, identifying code that is not DRY is a good way to start in the refactoring process.  Refactoring means taking a unit of code and rewriting it without changing its functionality.  When undertaking a long-term project it is critical to refactor and to refactor often.  When suboptimal code is left for too long it creates big roadblocks in the future when developers return to add a new feature.  Therefore you should always leave extra room in your budget and schedule for refactoring.

The DRY principle extends beyond the realm of computer programming.  Even non-engineers can benefit greatly from it.  Have you ever used a template to add common formatting to a document?  Have you ever used “Find and Replace”?  Then you have been following the principle.  

There is a lot of software available that can help you stay DRY:  Apple provides Automator in Mac OS.  Photoshop has an “Actions” palette that can save you hours of tedium.  Learning to use these tools will give you a big leg up on the average Joe who contents himself with carefully repeating a task over and over again all day, unwittingly transforming himself into an expensive and unreliable machine.

Unfortunately, staying DRY isn’t always easy.  It requires programmers to stop and think critically about the work that they’ve done.  It takes discipline to rework sections of code that work just fine but contain a lot of excess duplication.  While there are tools available that can find code that bears too much repetition, fixing the problem requires a degree of skill and planning that a computer does not begin to possess.  

DRY is not a panacea; it’s important to understand that it won’t necessarily speed up a project, especially in the short run.  Maintaining coding standards instead should be thought of as an investment in the future of your application.

####Tools We Use at The Code Builders

There are some important tools we use to help keep our code DRY.

#####CSS Preprocessors
Although the CSS language for describing the appearance of HTML is concise and easy to understand, it requires a lot of duplication.  For example, it lacks variables so one can’t define a color like “header-blue” and expect to use it throughout the document.  Instead, one must write in the hexadecimal code that represents the color over and over again.

CSS preprocessors solve this problem by adding sorely-needed features to CSS.  The two most popular preprocessors are SASS and LESS, which are extremely similar to one another.  We use whichever is most convenient for the project at hand.  When the site is ready to deploy, the tool outputs standard CSS.  A nice bonus is that the preprocessor can compact the output so that it loads faster than it would if it was handwritten CSS.

#####Package Managers
It’s a lot of effort to find libraries needed for a project, download them into the project folder, and then keep them up-to-date as the various teams that maintain them bring out new versions.  Fortunately, a popular application called Bundler has inspired a new generation of package managers for all of our favorite languages.

In PHP we use Composer; in Objective-C, Cocoapods.  JavaScript has npm, which was built for Node.js on the server, and Yeoman, which Google released last month and looks like a very promising tool for front-end development.

Hopefully this brief introduction to the DRY principle has illuminated some of the problems that software engineers face, and some of the solutions available to them.  It may be counterintuitive, but it often takes longer to write concise code than it does to write thousands of lines of less-carefully constructed programming.  However, it is well worth the extra effort.  

As a client, you should always insist on quality over quantity because code will be read many more times than it is written. Any time saved up front with shoddy coding will be lost at the end of the project as the system becomes more complicated and difficult to understand.  Keeping the code DRY helps mitigate stress around deadlines, and will lead to better results and a happier working relationship.
