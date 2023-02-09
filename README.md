# SequisTest

This is a homework test for SequisLife mobile engineer test. Here is a preview of what is being done in this project:

![](https://github.com/Your_Repository_Name/MainScreen.gif)
![](https://github.com/hainayanda/SequisTest/DetailScreen.gif)

## Project Structure

This project is using plain `xcodeproj` with Swift Package as its modularization tool. 

## Modules

The modules created here are on extreme modularization (since every page has its modules), which is an attempt to display my capabilities in modularization.
The modules are divided into 2 layers:

- Features (`MainFeature` and `DetailFeature`)
- Common (`CommonUI` and `CommonNetworking`)

All modules in the same layer should not import each other. All modules in the lower layer can be imported by any of the modules above.
There is one module that is on the bottom of the layers and can be imported by any modules in the project which is `CommonUtilities`.
Since feature modules in the same layer might need to use some part of each other, there is an intermediate layer that acts as a mediator for each feature module which is `SharedFeatureDependencies`.
To better understand the structure, please refer to this diagram below:

![](https://github.com/hainayanda/SequisTest/Modules.jpg)

### Main Feature and Detail Feature

These are the feature modules that focussed on the business process of the feature. In this homework, the `MainFeature` is the `MainScreen`, and `DetailFeature` is the `DetailScreen`. In the real world, this will be better if put inside the same module.

### SharedFeatureDependencies

These Modules will contain any protocols and abstractions that are implemented in the Feature modules. Those will be used by any Feature modules as an abstraction of the injected implementation that comes from its module's origin.

### CommonUI

This is where the common component and UI utilities are.

### CommonNetworking

This is where services, and models are implemented

### CommonUtilities

All of the utilities like extensions, or any helper will be put here

### Other SubModules

Every module have its test module, but other than that, there are some shared modules that are created as unit test modules:
- `CommonNetworkingMock` which contains all of the service mock and model generators
- `CommonTestUtilities` which contains all of the utilities for the test. This homework its still empty but used as modules that provide dependencies to other test modules

## Third-Party Library

This project uses some dependencies using SPM:
- [Impose](https://github.com/hainayanda/Impose) (my own dependency injection library)
- [Realm](https://github.com/realm/realm-swift)
- [swiftui-cached-async-image](https://github.com/lorenzofiamingo/swiftui-cached-async-image)
and for unit tests:
- [Quick](https://github.com/Quick/Quick)
- [Nimble](https://github.com/Quick/Nimble)
- [Fakery](https://github.com/vadymmarkov/Fakery)