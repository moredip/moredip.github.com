%%%%%%%%
title: Frank lightning talk
author: Pete Hodgson 
%%%%%%%%

!SLIDE

<div style="width:100%;margin-left:auto;margin-right:auto">
<img style="padding:5%" width="90%" src="http://moredip.github.com/business_card.jpg"/>
</div>

What is Frank?
=====

Frank is a system for running automated tests against an iOS (iPhone/iPad) app. 

It's like a very basic Selenium for native apps.

It was created by my team so that we could write cucumber tests for the iPad application we're developing. 

Demo
====
<a target="_blank" href="http://vimeo.com/16591775">here's a demo of Frank in action</a>

How does Frank work?
===================

Frank consists of two parts:

* A small HTTP server written in Objective C is embedded into the app itself.
* A driver which sends commands to that server (we're using ruby/cucumber for that).

The testing framework sends commands to the embedded HTTP server in order to inspect the current state of the UI and to perform actions against the UI.

A pretty diagram
================

![Frank Architecture](http://github.com/moredip/frank/raw/master/doc/Frank%20Architecture.png)

Cucumber integration
====================

Frank comes bundled with Cucumber integration, allowing you to write cuke tests which drive your native iOS app. For example:

    Given I have launched my app
    When I fill in the "username" textbox with "pete"
    And I fill in the "password" textbox with "sekrit"
    And I touch the button marked "Logon"
    Then I should see "Welcome back, Pete"

[see here for further examples](https://github.com/moredip/Frank/blob/master/example/EmployeeAdmin/features/main.feature)

Other automation facilities 
===========================
We've also had success in automating:

* rotation of the simulator
* restarting the simulator
* launching an arbitrary build into the simulator
* recording a test run using QuickTime

Symbiote
========

The Frank server embedded in your app also serves up a simple single-web-page app called Symbiote.

Symbiote uses some basic HTML forms and javascript to talk to your running iOS application using the exact same API which your cuke scripts use.

It provides something like a crappy version of Firebug for your native iOS app. It allows you to inspect the state of the app, and to test selector paths as you start the process of automating a new section of your app's UI.

By default it runs on [http://localhost:37265/](http://localhost:37265/)

Other Cool Stuffs 
=================

In addition to the basics of testing our iPad app using Frank, we've also had success with:

* running Frank tests as part of our CI build
* Creating a QuickTime recording of each test run as a CI artifact 
* extending Cucumber to append timestamps to each scenario name \[[on github](https://github.com/moredip/Timestamped)\]
* extending Cucumber to report which step is currently running (as opposed to which step just completed) \[[on github](https://github.com/moredip/SlowHandCuke) and also [packaged as a gem](https://rubygems.org/gems/slowhandcuke)\]

Thanks!
=======

* These slides are available [here](http://moredip.github.com/frank_lightning_talk_slides.html)
* [Frank is on github](http://github.com/moredip/frank)
* [My initial blog post announcing Frank](http://blog.thepete.net/2010/07/frank-automated-acceptance-tests-for.html)
* [A podcast about Frank recorded with some colleagues at ThoughtWorks](http://bit.ly/9cyMjT)

I'm always happy to talk more about Frank

* @beingagile
* phodgson@thoughtworks.com
