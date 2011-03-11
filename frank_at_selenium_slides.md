%%%%%%%%
title: Frank: Acceptance Testing for native iOS apps 
author: Pete Hodgson 
%%%%%%%%

!SLIDE

<div style="width:100%;margin-left:auto;margin-right:auto">
<img style="padding:5%" width="90%" src="http://moredip.github.com/business_card.jpg"/>
</div>


# What is Frank?

Frank is a system for running automated tests against an iOS (iPhone/iPad) app. 

It's like a very basic Selenium for native apps.


# History of Frank

It was created by my team as part of an iPad product we were helping develop.

No unit testing coverage, but we wanted some sort of test coverage.

We examined some existing solutions, none were quite right.


# Why do we need acceptance testing for iOS apps?

"iPhone apps are so simple there's nothing to test". 

Really?

Mobile app development is a very iterative process.


Demo
====
<a target="_blank" href="http://vimeo.com/16591775">here's a demo of Frank in action</a>


What's behind Frank?
===================

Frank combines several existing open source tools

* UISpec, a lower-level Objective-C testing library 
* cocoahttpserver, a lightweight embeddable HTTP server
* cucumber, and various little ruby gems

It's also spawned a few little things of its own

* sim_launcher - launch arbitrary iOS apps in the simulator from the command line
* slow_hand_cuke - better feedback on what cucumber step is currently executing 
* timestamped_scenarios - add timestamps to cucumber output


How does it all work?
================

![Frank Architecture](http://github.com/moredip/frank/raw/master/doc/Frank%20Architecture.png)


# Cucumber

* A framework for Behavior Driven Development
* The aim is to allow you to express your tests in the language of the domain

---

An example cucumber scenario

    Given I am logged in as a user with an empty shopping cart
    And I am on the home screen 
    When I click 'Checkout'
    Then I should see 'You have nothing in your cart'
    And I should still be on the home screen


# Frank tests are cucumber tests

    Given I have launched my app
    When I fill in the "username" textbox with "pete"
    And I fill in the "password" textbox with "sekrit"
    And I touch the button marked "Logon"
    Then I should see "Welcome back, Pete"

[see here for further examples](https://github.com/moredip/Frank/blob/master/example/EmployeeAdmin/features/main.feature)


# Standard Frank step definitions

Frank comes with a set of pre-defined steps. For example:

* Given the device is in landscape orientation
* When I fill in "foo" with "bar"
* When I touch the table cell marked "foo"
* When I simulate a memory warning 
* Then I should see "foo"
* Then I wait to see "foo"
* Then I should see an alert view
* etc

[see here for the full set of core steps](https://github.com/moredip/Frank/blob/master/gem/lib/frank-cucumber/core_frank_steps.rb)

#How do these steps work?

for example:

    Then /^I should see a "([^\"]*)" button$/ do |expected_mark|
      check_element_exists("button marked:'#{expected_mark}'")
    end

#Symbiote

The Frank server comes bundled with a single-page web app called Symbiote. It's like a very basic Firebug for iOS apps. 

By default it runs on [http://localhost:37265/](http://localhost:37265/)


#iOS vs Web testing

## What's the same?

## What's different?


#What's next?

## Learning from mature tooling (like Selenium!)
## Sharing tests across platforms



#Thanks!

* These slides are available [here](http://moredip.github.com/frank_at_selenium_slides.html)
* We have a growing community centered around our [mailing list](http://groups.google.com/group/frank-discuss). Join us!
* Frank is open source, and [available on github](http://github.com/moredip/frank)
* [My initial blog post announcing Frank](http://blog.thepete.net/2010/07/frank-automated-acceptance-tests-for.html)
* [A podcast about Frank recorded with some colleagues at ThoughtWorks](http://bit.ly/9cyMjT)

I'm always happy to talk more about Frank, and about mobile testing in general.

* @beingagile
* phodgson@thoughtworks.com
