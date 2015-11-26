# SFU CMPT276 Fall 2015 Group 7 Project

Group 7 Project. Will be documented... eventually.

Many thanks to [Michael Hartl's Rails Book](https://www.railstutorial.org/book/frontmatter)

<<<<<<< HEAD
Nov.18
CSS Homepage:
- added padding to body top so when minimized, toolbar does not cover logo
- changed background color
- added carousel to homepage for sneak peak or ads, picture images possible
=======

#### Some Notes (Jonathan):

##### Remarks (Nov 7):

~~need to complete facebook implementation, but skeleton authentication is working~~

~~create db columns to store fb authentication data~~

-[Koala](https://github.com/arsduo/koala) is actually very nicely documented, should use it for our API calls


##### Remarks (Nov 8):

~~-finished authentication with facebook, just need to clean up some code~~

-should work on interfacing, routes (users can't access other private stuff)

~~-need to familiarize more with Koala API specifically with facebook auth tokens~~

~~-start to do basic API calls on "news feed"~~

##### Remarks (Nov 9):

~~-really need to start work on layout (should ask the group.... if they feel like working on it.......)~~

~~-need to study callbacks (URL) and api calls more... probably need to store all credential data in a DB for calls from pages other than auth/:provider to auth/:provider/callback~~

~~-thus, more migrations!!~~

##### Remarks (Nov 10):

-added columns to store user tokens, now can call facebook API calls on other pages

-users should be able to log in with facebook and see their name/picture

-start to implement other platforms, and add security measures for current authentications

##### Remarks (Nov 19):

-authentications slightly more generalized (twitter half implemented)

##### Remarks (Nov 23):

-instagram callback url very confusing... possibly just a temporary bug but no time to find out... consider scrapping IG from project unless can fix

-post model made, just need to grab posts from twitter and combine them with FB posts

##### Remarks (Nov 25):

-add columns to posts to begin combining facebook and twitter posts
>>>>>>> 4205bdafa652c6b007af3d442529432114889576
