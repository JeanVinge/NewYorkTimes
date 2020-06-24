# App

The project *App*, has the meaning for itself, it's responsable for execute the App.

The *App* has two modules:

- App,
- AppFlowKit.

## App module

The module App, that is the entry point, containing the *AppDelegate*.
The *AppDelegate* calls MainCoordinator, and it's responsable to build screen chain.

The idea is, to have this module smaller as posible, and give power to the coordinator for building screen, and deliver complex navigation logic.

## AppFlowKit

The AppFlowKit, is responsable just for coordinate app navigation.
It uses the coordinator concept that in fact is very simple, it takes the logic from the viewcontroller and isolate inside the coordinator, the result is a dumber viewcontroller, that dont need to know where their actions lead.


