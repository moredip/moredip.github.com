%%%%%%%%
title: Frank: Acceptance Testing for native iOS apps 
author: Pete Hodgson 
%%%%%%%%

# Hi!
<div style="width:100%;margin-left:auto;margin-right:auto">
<img style="padding:5%" height="50%" src="http://moredip.github.com/business_card.jpg"/>
</div>

TMI

# What is Frank?

It's like a very basic Selenium for iPhone and iPad apps.

# History of Frank

Created to help build an iPad product my team were delivering. 

We wanted a safety net of automated tests, unit testing for iOS seemed really challenging.

We examined some existing solutions ...

* UISpec
* Bromine/Brominet
* iCuke

... but none were quite right.


<!--
# Why do we need acceptance testing for iOS apps?

"iPhone apps are so simple; there's nothing to test".     Really?

<hr/>

Mobile app development is a very iterative process.

Test suites can help with performance and memory issues, not just bugs.

Why wouldn't you want acceptance tests?
-->


# Demo
<a target="_blank" href="http://vimeo.com/16591775">here's a demo of Frank in action</a>



# How does it all work?

![Frank Architecture](http://github.com/moredip/frank/raw/master/doc/Frank%20Architecture.png)



# What's behind Frank?

Frank combines several existing open source tools

* UISpec, a lower-level Objective-C testing library 
* cocoahttpserver, a lightweight embeddable HTTP server
* cucumber, and various ruby gems

It's also spawned a few little tools itself 

* sim_launcher - launch arbitrary iOS apps in the simulator from the command line
* slow_hand_cuke - better feedback on what cucumber step is currently executing 
* timestamped_scenarios - add timestamps to cucumber output



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
<br/>

    Given I am logged in as a user with an empty shopping cart
    And I am on the home screen 
    When I click 'Checkout'
    Then I should see 'You have nothing in your cart'
    And I should still be on the home screen


# Frank tests are cucumber tests

    Scenario: Successful log in

    Given I have launched my app
    When I fill in the "username" textbox with "pete"
    And I fill in the "password" textbox with "sekrit"
    And I touch the button marked "Logon"
    Then I should see "Welcome back, Pete"

[see here for further examples](https://github.com/moredip/Frank/blob/master/example/EmployeeAdmin/features/main.feature)

#How do these steps work?

Slightly scary regex's, and not-so-scary ruby 

    Then /^I should see a "([^\"]*)" button$/ do |expected_mark|
      check_element_exists("button marked:'#{expected_mark}'")
    end

Can also call steps from within steps. Careful with that.

Frank doesn't have a Webrat/Capybara equivalent, yet.



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

# UISpec selectors

Web Testing: CSS or XPath

Frank: UISpec's UIScript syntax

Syntax is a little funky, but servicable. 

    tableView button marked:'Add'

Allows traversal (e.g. all children, first child, parent) and filtering (e.g. just views of class UIButton, with accessibilityLabel 'foo')


#Symbiote

The Frank server comes bundled with a single-page web app called Symbiote. It's like a very basic Firebug for iOS apps. 

By default it runs on [http://localhost:37265/](http://localhost:37265/)

Allows inspection of a running app's view heirarchy (i.e. DOM)

Allows testing of selectors on a running app


#iOS vs Web testing

## What's different?
* State!
* Hardware constraints - memory, rotation, performance
* Only one platform!
* testing tooling is still immature, for now

## What's the same?
* Maintaining a big test suite is hard 
* Seperation of business language from UI/technical language



#What's next?

## Learning from mature tooling (like Selenium!)
If all goes well, Frank has a lot of growing pains to look forward to!

## Sharing tests across platforms
Business functionality doesn't care whether it's implemented on web, iOS, Android, whatever

## Other stuff
Maybe moving beyond Cucumber and Ruby?


#Thanks!

* These slides are available [here](http://moredip.github.com/frank_at_selenium_slides.html)
* Frank is open source, and [available on github](http://github.com/moredip/frank)
* We have a growing community centered around our [mailing list](http://groups.google.com/group/frank-discuss). Join us!
* [My initial blog post announcing Frank](http://blog.thepete.net/2010/07/frank-automated-acceptance-tests-for.html)
* [A podcast about Frank recorded with some colleagues at ThoughtWorks](http://bit.ly/9cyMjT)

I'm always happy to talk more about Frank, and about mobile testing in general.

* @beingagile
* phodgson@thoughtworks.com
