# NetworkLayer

The *Network layer* is a important part, it deliver the information for the app shows into the screen.

The *Network Layer* has two modules:
- APICoreKit,
- NewsAPIKit.

## APICoreKit

The *APICoreKit*, has all the basic implementation and adaption to make a request, since wrapping up the thing arround URLSession classes.

It support encoding and decoding parameters, and flexibility to test end-to-end.

## NewsAPIKit

This module is responsable for the request to get the news list from new york times.
It implements a layer that will be plugged in somewhere.
