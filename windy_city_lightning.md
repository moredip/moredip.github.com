%%%%%%%%
title: Frank lightning talk for WindyCityGo
author: Pete Hodgson 
%%%%%%%%

Hi!
====

I'm Pete Hodgson, I tweet as [@beingagile](http://www.twitter.com/beingagile)

I want to run through a very quick talk about test automation for native iOS

-----

I'm a consultant at ThoughtWorks

We're hosting a 'conversation space' today

( oh and we're hiring )


What is Frank?
=====

Frank is a tool for running automated acceptance tests against native iOS apps.

It's like a very basic Selenium for native apps.

It was originally created by my team so that we could write cucumber tests for the iPad application we're developing. 

Demo
====
<a target="_blank" href="http://vimeo.com/21860134">here's a demo of Frank in action</a>

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


How does Frank work?
===================

Frank consists of two parts:

* A small HTTP server written in Objective C which you compile directly into your native app.
* A driver which sends commands to that server (we use ruby/cucumber for that).

The testing framework sends commands to the embedded HTTP server in order to 

- **inspect** the current state of the UI 
- **select** specific UI elements and then
- **invoke** actions against those elements

A pretty diagram
================

![Frank Architecture](http://github.com/moredip/frank/raw/master/doc/Frank%20Architecture.png)

Symbiote
========

The Frank server embedded in your app also serves up a simple single-web-page app called Symbiote.

- Allows basic inspection of your running app's view heirarchy.

- Allows testing view selectors against your live app.

- Uses exact same API as the cucumber scripts - inspection, selection, invocation.


By default it runs on [http://localhost:37265/](http://localhost:37265/)


Other automation facilities 
===========================
We've also had success in automating:

* rotation of the simulator
* restarting the simulator
* launching an arbitrary build into the simulator
* recording a test run using QuickTime
* reliably running a large test suite (45 mins long!) as part of a CI pipeline

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
