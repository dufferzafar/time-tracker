# Time Tracker v0.2

![Tracker](/Data/TimeSmall.png)

An application to track your activities.

UPDATE: I don't want to say this, but this REPO is now an abandonware.
        I figured out that writng code is not always the solution.
So I now use [Manic Time](www.manictime.com) for all the tracking, it has much more than I actually need but that's the way it is...

[This](http://blog.stephenwolfram.com/2012/03/the-personal-analytics-of-my-life/) amazing post from [this](http://en.wikipedia.org/wiki/Stephen_wolfram) awesome man is the driving force of this project.

## Table of Contents

* [The Plan](#plan)
* [To Add Later](#later)
* [Changelog](#changelog)

## <a name="plan"></a>The Plan

The 'application' will consist of two parts: AHK + JS.

The tracking part will be done via an AHK script that'll run silently in the background. It'll monitor things like the current active window, keystrokes, mouse movements and idle (AFK) time.

While the Graphing and Data Analysis will be done in the form of a webapp using Bootstrap/Javascript and other web-fu stuff.

Currently I'm more focussed on the AHK part.

There is [sister project](http://github.com/dufferzafar/internet-usage) going on though which is inclined towards the web part as the data is already present in that case and it just has to be visualised.

**Tracking - AHK**

The core part of the script will monitor the "Current Active Window" - it'll keep track of what's active right now and how much time has been spent on this particular application.

The data will be dumped to an output file, periodically (say an hour). 

The applications can be categorised, so you can know the time you've spent on "Development", "Entertainment", "Web Browsing".

You can also create Whitelists - only some applications will be tracked as such and the rest will be added to category "Others". Or Blacklists - applications in this list will be ignored and added to "Others"

The records will be saved on a per day basis, but they can later be converted to per month/year.

We'll have data like:
  * Most Used Application
  * Time spent per Application
  * Time spent per Category

Algorithm:
  * On Start: Dump session start time
  * Monitor 
  * Dump Data
  * Keep Monitor
  * On End: Dump session end time

Steal Ideas From:
  * [Wakatime](www.wakati.me)
  * [Manic Time](www.manictime.com)
  * [Rescue Time](www.rescuetime.com)

## <a name="todo"></a>Todo ASAP

* Chrome Extension
  * append www if it isn't already there..
  * indexof("www.")

* Sessions ?
  * in a day
  * start - end
  * what if the app is closed. re-run.

* Output
  * A file per day
  * XML

* Presistent Timer
  * 1 second (Variable?)

## <a name="later"></a>To Add Later

* Google Chrome
  * Most visited websites

* Sublime Text
  * Time spent per file/project

* Windows Explorer
  * Time spent per folder
  * Generate favorite folders from the pattern

* Keystroke Monitor

* Go off the record: Pause tracking.

## <a name="changelog"></a>Changelog

13/12/2013 : 
* Abandon Ship!!

15/11/2013 :
* Output Schema. AHK functions using COM/MSXML.
* Updated: Chrome extension to use host instead of href.
* Redid the Readme.

04/11/2013 :
* Testing Basic Functionality:
  * Window Titles/Process Names/Paths
  * Every 15 Minutes Output

03/11/2013 :
* Created a Google Chrome Extension to get URLs from the chrome's title bar.

* Readme Done.

<!-- Reset Chrome Time Tracker: 01/11/2013-21:32 -->


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/dufferzafar/time-tracker/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

