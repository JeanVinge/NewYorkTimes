# New York Times Reader 📱

## Requirements

- [x] XCode 11.x

## Features

- [x] landscape and portrait orientation,
- [x] supporting devices greater than iOS 12,
- [x] screen previews,
- [x] swift package manager,
- [x] handles internet failure, and stores executed request result,
- [x] implemented emailed, shared and viewed tabs, as proposed in test.

## Building and runnning

In order to execute the app you need to do the following steps:

- open new-york-times-ios.xcworkspace,
- execute scheme App.

## Introduction

![Image](resources/diagram.png)

The diagram shows how the app was built, all the details will be explained in details, the architecture focused on modularity, basically using solid concepts.

## Main concepts

- The app used SOLID concepts, which means the decision to prefer modularity, is also some concepts that requires isolation and single responsability.
- Also the achitecture used Design Pattern for standard implementations, that for eg are factories and adapters.

## Modules

- [App](/App/README.md)
- [Appearence](/Appearence/README.md)
- [Feature](/Feature/README.md)
- [NetworkLayer](/NetworkLayer/README.md)
- [Utilities](/Utilities/README.md)
