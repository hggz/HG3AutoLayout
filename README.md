# HG3AutoLayout
Extensions to help make building auto layout views easier. IB is a great tool which simplifies the process of creating dynamic views using auto layout, However, outside of creating a view subclass with a .xib, I felt that there wasn't much support for easily creating light weight widgets to reuse throughout your project. This framework was designed to make my job easier when creating these light weight widgets programatically.

## Installation:

### Cocoapods:
add the following pod to your project:

pod 'HG3AutoLayout', :git => 'https://github.com/hgonzalez94/HG3AutoLayout.git'

add the framework to your bridging header file:

HG3AutoLayout/HG3AutoLayout.h

#### NOTE:
Swift Frameworks in cocoa pods are currently in beta. For this framework to work, don't forget to add the following flag to your cocoapod file:

##### use_frameworks!
