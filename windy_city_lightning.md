%%%%%%%%
title: Frank lightning talk
author: Pete Hodgson 
%%%%%%%%


What is Frank?
=====

Frank is a tool for running automated acceptance tests against native iOS apps.

It's like a very basic Selenium for native apps.

It was originally created by my team so that we could write cucumber tests for the iPad application we're developing. 

Demo
====
<a target="_blank" href="http://vimeo.com/21860134">here's a demo of Frank in action</a>

How does Frank work?
===================

Frank consists of two parts:

* A small HTTP server written in Objective C is embedded into the app itself.
* A driver which sends commands to that server (we're using ruby/cucumber for that).

The testing framework sends commands to the embedded HTTP server in order to inspect the current state of the UI and to perform actions against the UI.

A pretty diagram
================

![Frank Architecture](http://github.com/moredip/frank/raw/master/doc/Frank%20Architecture.png)

# Cucumber

* A framework for Behavior Driven Development
* express business requirements in the language of the domain
* automate verification of those requirements
* most commonly used for describing the behavior of web apps



# An example cucumber scenario


Given ...<br/>
When ...<br/>
Then ...

---

    Scenario: Successful log in

    Given I have launched my app
    When I fill in the "username" textbox with "pete"
    And I fill in the "password" textbox with "sekrit"
    And I touch the button marked "Logon"
    Then I should see "Welcome back, Pete"

[see here for further examples](https://github.com/moredip/Frank/blob/master/example/EmployeeAdmin/features/main.feature)

Symbiote
========

The Frank server embedded in your app also serves up a simple single-web-page app called Symbiote.

Symbiote uses some basic HTML forms and javascript to talk to your running iOS application using the exact same API which your cuke scripts use.

It provides something like a crappy version of Firebug for your native iOS app. It allows you to inspect the state of the app, and to test selector paths as you start the process of automating a new section of your app's UI.

By default it runs on [http://localhost:37265/](http://localhost:37265/)


Other automation facilities 
===========================
We've also had success in automating:

* rotation of the simulator
* restarting the simulator
* launching an arbitrary build into the simulator
* recording a test run using QuickTime

# Yay! Now what? 

Frank has an active and growing community of users. [Join us!](http://groups.google.com/group/frank-discuss)

I'm at the ThoughtWorks conversation space. I'd love to explain more, and help you Frankify your app.

I tweet as [@beingagile](http://twitter.com/beingagile), I blog at [thepete.net](http://thepete.net).

More resources
=======

* These slides are available [here](http://moredip.github.com/windy_city_lightning.html)
* [The mailing list](http://groups.google.com/group/frank-discuss)
* [Frank is on github](http://github.com/moredip/frank)
* [My initial blog post announcing Frank](http://blog.thepete.net/2010/07/frank-automated-acceptance-tests-for.html)
* [A podcast about Frank recorded with some colleagues at ThoughtWorks](http://bit.ly/9cyMjT)
