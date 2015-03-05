# mission-confetti
First Presentation for Flatiron Presents

TO DO:

There are 2 problems I thought of that we can solve with 1 solution.

PROBLEMS:
1. What if the API stops accepting our requests (since we're not paying for it!)?
2. When you search for a keyword on our site the response is slow.
3. If a user makes a 'post' associated with a podcast, that association will be broken if we clear the database.

POTENTIAL SOLUTION:

	- I think we actually shouldn't be clearing the database each time we do a search. We can keep the database stocked with 'standard' search terms (the ones on the front page of our site) and then allow users to do custom searches for keywords, or podcasts titles, for example, and we can hit the API each time with those searches but use our own database for more common search terms.
	- How to do this: instead of clearing the database, create TAGS for each podcast so that if you click on or search for 'music', for example, any podcast tagged with music appears on the results page.
			- We can use activerecord to create a Tags class and use a join table to connect tags with Podcasts so that podcasts can have many tags and tags can have many podcasts.

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

TODAY 3/5/2015
- let's decide how much of this functionality we'll need to build before Tuesday.
- let's start to talk about our presentation/keynote presentation and how we want to build it.
- let's map out the framework for our site (RS- I brought the papers from our brainstorm at my apartment and we can build upon them).
- let's decide whether the iTunes podcast directory has information that the API doesn't have and whether we still need to rely on it. (I think the API doesn't have episode information.)