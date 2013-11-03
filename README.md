# Time Tracker v0.0

![Tracker](/Data/Time.png)

An application to track your activities. Gain an insight of what you've been doing with your time.

## Table of Contents

<!-- * [Usage Scenario](#usage) -->
* [Stuff To Do](#todo)
* [More Features To Add Later](#later)
* [Changelog](#changelog)

## <a name="usage"></a>Dev Notes

The 'application' will actually consist of two parts: AHK + JS.

The core tracking part will be done via an AHK script that'll run silently in the background and will monitor the "Current Active Window" - it'll keep track of what's active right now and how much time has been spent on this particular application.

While the Graphing and Data Analysis will be done using Javascript in the form of a webapp.

The data will be dumped to an output file, periodically (say an hour). The output data can then be used to plot graphs (oh! those sexy graphs).

The applications can be categorised, so you can know the time you've spent on "Development", "Entertainment", "Web Browsing".

You can also create Whitelists - only some applications will be tracked as such and the rest will be added to category "Others". Or Blacklists - applications in this list will be ignored and added to "Others"

The records will be saved on a per day basis, but they can later be converted to per month/year. (In JS)

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
  * [Manic Time](www.manictime.com)
  * [Rescue Time](www.rescuetime.com)

## <a name="todo"></a>Todo

* Go off the record: pause tracking :)

* Presistent Timer
  * 1 second (Variable?)

* Active Window
  * Title (Tabs of an app)
  * Class

## <a name="later"></a>More Features To Add Later

* Output XML

## <a name="changelog"></a>Changelog

* Created a Google Chrome Extension to get URLs from the chrome's title bar.
* Readme Done.

<!-- Reset Chrome Time Tracker: 01/11/2013-21:32 -->
