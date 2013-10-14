---
layout: post
title: "Try This When UIView Animations Don't Work"
date: 2013-05-24 21:45
comments: true
categories:
- iOS
- Objective-C
---
Sometimes when you set up an animation in a UIView that you want to run as soon as the view is displayed, you'll encounter an issue where the animation doesn't run and proceeds to its completed state without any delay.

For example, take the following code:

``` objective-c
[UIView animateWithDuration:0.25 animations:^{
    _buttonView.layer.transform = CATransform3DMakeScale(0, 0, 1);
} completion:^(BOOL finished) {
    NSLog(@"animation complete");
}];
```

In this case what often happens is that the button will disappear instantly instead of showing the 0.25 second animation.  Confusingly, it also displays the log message after 0 seconds. There is no delay happening at all.  Why are our perfectly clear instructions being ignored?

Worse yet, this problem is often intermittent.  Sometimes it will work fine, and other times it won't.  You may even be able to solve the issue by adding a delay with the `animateWithDuration: delay: options: animations: completion: ` method.  But how can you know how long to make the delay?  On slower devices it may have to be longer.

So here's what's really going on: Core Animation is making a decision for  you. If the view is not in the view hierarchy, it should not waste cycles animating.  Furthermore, the animation should not ever start midway through (that would look bad, right?).  So it forces any offscreen animations to immediate completion.

How do you solve this?  It's very simple: since your view is almost certainly being managed by a controller, just make sure that you do not try to run any animations before the UIViewController's `viewDidAppear:` method is called (and make sure the view has been added to the hierarchy with `[view addSubview:]` or similar).

You could also check if the view has a superview, but it would be a lot tricker; the superview itself may not have a superview yet, and if there is no superview you will need to set a timer to check again.  Too much work in my book.