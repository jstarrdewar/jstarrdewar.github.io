---
layout: post
title: "The Correct Way to Override Concrete Backbone Methods Like Model.save"
date: 2012-07-20 16:07
comments: true
categories:
- JavaScript
- Backbone
- MVC
---

I've been using Backbone.js for the first time on my latest project.  I've found it to be very helpful, providing a clear structure for breaking up large pieces of JavaScript into smaller, more manageable submodules.

I just ran into an issue when I decided I needed to override the set and save methods of the Model class.  I followed the documentation's example (reproduced below):

``` js
set: function(attributes, options) {
    Backbone.Model.prototype.set.call(this, attributes, options);
    ...
}
```

Unfortunately, it didn't work fully.  Only one of my calls to `save()` would work with the override in place.  It turns out there are a few different things that can go wrong.

First of all, you should return the result of the call to the prototype.  It's not always void, and if it gets called indirectly there will be problems from internal methods that read the return value.  So this is a better template to follow:

``` js
set: function(attributes, options) {
    ...
    return Backbone.Model.prototype.set.call(this, attributes, options);
}
```

(Thanks to Eggi and Brian Genisio from pointing this out in their comments on this [Stack Overflow Answer](http://stackoverflow.com/questions/7607921/backbone-js-collection-create-and-overridden-model-set).)

If you need to run the super method before your override logic, then you can store the returned value (I don't think this will be a common scenario with Backbone):

``` js
set: function(attributes, options) {
    var result = Backbone.Model.prototype.set.call(this, attributes, options);
    ...
    return result;
}
```

The second problem you may encounter (more specific to set/save) is that the actual function signature of Backbone.set and Backbone.save is this:

``` js
set: function(key, value, options) {}
```

What happens is that you can call `set()` or `save()` you can use two different forms:

``` js
// These are equivalent:
Model.set('key', 'value');
Model.set({key: value});
```

This works because Backbone checks to see if `key` is an object literal or not with `_.isObject(key)`.  If it is, then it assumes `key` is attributes and the `value` argument actually represents the options object (it simply ignores the `options` argument).

The upshot of this is that if you override the function signature you can't use the `('key', 'value')` form without doing similar logic in your method override.  I suppose this is why the documentation shows only the object literal form in their example.  It's a bit impractical to recreate this every time you override the method, especially because you are probably responding to the attributes.  However, later on you may not remember that you have overriden the save or set method and attempt to call it with the simplified key/value form.  That will leave you scratching your head for a little while until you Google this blog post ;-)