<h1>Deli Marketplace</h1>

<p>
  I grew a bit hoemsick for the delis of my native land, so I made a website for a fictional one! The premise of the site is pretty general - just provide people a place where they can peruse a deli menu and add various products to their shopping cart. I'm really happy with how this came out and it was really fun to build!
</p>

<p>
  The main customer-facing page features a full menu of items, plus a search bar atop the page. The search functionality for this app using "fuzzy" matching, so that if a user only puts in part of a product name, that product will still feature in the results. There's also a filtering dropdown for different dietary restrictions! Each item has a button to be added to a customer's cart and, upon clicking, the user will be taken *to* their cart for review.
</p>

<p>
  The cart functionality was based on using the sessions hash - when the site is opened, the session is checked to see if a cart already exists and either creates a new one or loads the Cart object with the matching cart_id. When a user clicks to add an item to their cart, that item is first turned into a line item behind the scenes, and then it is checked against its existence in the cart. If the item is already present, the quantity is incremented - if not, it builds a new line item. The price in the cart reflects the sum of all items, and then the user can either go back to the menu or empty their cart. There is currently no payment functionality but in the future I could add Stripe - the scope of this project was mainly to build out a working cart functionality.
</p>

<p>
  There is also a "hidden" admin side of the site which can be viewed if you go to the /products path. You'll be prompted to log in, adn then you'll see a table view of all current products. From there, the "deli owner" can make new items, edit existing ones, and delete menu items. This was built to model a faux-admin panel to show the business end of the deli itself. There is no link to this path on the site so that a general user can't find the link and mess with the menu.
</p>

<p>
  I hope you enjoy checking it out!
</p>
