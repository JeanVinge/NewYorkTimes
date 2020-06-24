# Utilities

The *Utilities* project gives some helpers, and handy methods, that other modules can rely on.
This project, in theory shares the most features, because when you start to build a app, in some point you are going to need some methods and extensions that will be used in the entire app.

This project has four modules:
- Future,
- NewsDomainKit,
- LocalizationKit,
- MockKit.

## Future

Future helps with asyncronization code in a reactive way, you can observe and transform, leading to a code more organized instead of using callbacks, it's based by [John Sundell's code ] (https://www.swiftbysundell.com/articles/under-the-hood-of-futures-and-promises-in-swift/).

## NewsDomainKit

This module contains models that are related to news, the idea is if in the future the app has another context for example a model called *Review*, it can be another module, this is to keep the isolation between modules, so they don't need to have the response to have that object.

## LocalizationKit

LocalizationKit holds all the app texts, and help to localize them, if the app supports a new language, will need just to update the localizable files.

## MockKit

MockKit is a useful module that provide, resources for mocking objects, the idea for the module is that this module will be imported major in test modules, and screen preview, so the code will not be attached to the production .ipa.

