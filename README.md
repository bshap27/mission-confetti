# mission-confetti
First Presentation for Flatiron Presents

TO DO:

POTENTIAL SOLUTION:

Functionality to add:

1. Build forum/ability to post on each podcast.

2. allow users to 'like' / 'collect' / 'save' podcasts they like.
		- on podcast results page, include checkboxes that allow the user to add podcasts to their profile. simple post form.
		- need to make sure the Podcast and User models both have have_many assocations to each other and a join table.

3. Build user homepage
		Things to display:
				a. user's 'liked' podcasts
				b. all of the user's posts and the podcasts they are associated with.

4. Way down the road:
		a. allow users to connect with friends
		b. allow users to send or suggest podcasts to friends. (by podcast title? by episode??)


- let's decide whether the iTunes podcast directory has information that the API doesn't have and whether we still need to rely on it. (I think the API doesn't have episode information.)


SESSION ID WAS PERSISTING FROM PAST BEFORE I CLEARED THE DATABASE.

FUTURE FUNCTIONAL ADDITIONS:
- add home link on every page (or nav bar???)
- add your favorite podcasts to your homepage
- rate podcasts
- twitter feeds on each podcast
- follow on twitter for each podcast

Fix 'your account' link on index page post login - NoMethodError at /user_account
