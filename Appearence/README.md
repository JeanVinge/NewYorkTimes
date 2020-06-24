# Appearence

The *Appearence* project is responsable for layout, that includes look and feel for the app.
This project focus to isolate components, and maximize their reuse.

This project has four modules:
- UI,
- Layout,
- ColorKit,
- PreviewScreenKit.

## UI

UI is one of the core modules, every component is inside, this module can make components for any apple architecture even to a macOS app, so the more a view is customized, more you can plug in any environment.

Inside UI for example was created a view that contains a *tableView* and the implementation to reuse the *tableView*.

Also there's ListView, that is a *tableView* with it cell configured, in order to just plug this view in a content.

# Layout

It's for autolayout, a useful wrapper for NSLayoutAnchor, this code is bases from my repository [Tanjiro](https://github.com/JeanVinge/Tanjiro), Tanjiro is very similar to SnapKit.

# ColorKit

ColorKit has the color theme, so if there's a need to change a color of a property, it will affect the entire UI.

# PreviewScreenKit

The PreviewScreenKit has some wrappers to convert UIViewController to ViewRepresentable, as the UI is made by UIKit it needs to convert to use the preview.
It's extremely useful because you don't have to build the app to see the screen layouted.
