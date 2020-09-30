#!/bin/bash

killall dunst

/usr/bin/dunstify -a "dunst tester"         "normal"    "<i>italic body</i>"
/usr/bin/dunstify -a "dunst tester"  -u c   "critical"   "<b>bold body</b>"
/usr/bin/dunstify -a "dunst tester"         "long body"  "This is a notification with a very long body"
/usr/bin/dunstify -a "dunst tester"         "duplucate"
/usr/bin/dunstify -a "dunst tester"         "duplucate"
/usr/bin/dunstify -a "dunst tester"         "duplucate"
/usr/bin/dunstify -a "dunst tester"         "url"        "www.google.de"
