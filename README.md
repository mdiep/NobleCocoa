# NobleCocoa
A riff on [ReactiveCocoa][] that explores what's possible using plain Cocoa.

## What's with the name?
1. The last column in the periodic table is made up of 6 elements that are known as the _noble gases_ due to their low reactivity. This seemed like a good contrast to [ReactiveCocoa][].
2. _Noble_ seems like a good adjective to describe Cocoa, which is an excellent development platform.

## What's it all about?
[ReactiveCocoa][] combines a number of elements in a single framework:

1. A implementation of bindings (which are absent on iOS)
2. A layer on top of KVO
3. A method for reducing state in Cocoa and Cocoa Touch apps

(That's not an exhaustive list. But this isn't the place for such a list.)

As I learned about [ReactiveCocoa][] and some of the ideas that it's based on, I thought about how to minimize state in a Cocoa application without RAC. I realized that the basics could by achieved through KVO's [dependent keys][].

This is an example application, loosely based on joshaber's [RACSignupDemo][]. It uses KVO and bindings to perform some of the same work while minimizing state.

## Why do this?
1. To explore the limits of Cocoa
2. To explore what [ReactiveCocoa][] provides and how it's different than standard Cocoa.
3. To explore how to minimize state in apps that don't use [ReactiveCocoa][].

[ReactiveCocoa]:  https://github.com/github/ReactiveCocoa
[dependent keys]: http://developer.apple.com/library/ios/#documentation/cocoa/conceptual/KeyValueObserving/Articles/KVODependentKeys.html
[RACSignupDemo]:  https://github.com/joshaber/RACSignupDemo
