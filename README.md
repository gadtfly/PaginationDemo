Rather than merging it into your project only to be immediately thrown away in favour of the actual `will_paginate`, I just did a demo in a very simple sample app (just a `Things#index`).  Check it out [here](https://github.com/gadtfly/PaginationDemo/).

I made the "plumbing" as simple as possible.  Rather than globally adding behaviour to `ActiveRecord::Base` and `ActiveRecord::Relation`, as we were fumbling around with in our call earlier, I:

* Provide the `paginate` method to a model by [manually `extend`ing it with a module](https://github.com/gadtfly/PaginationDemo/commit/6c8b9c462606d0d04033859e73f1ca36f92eaad3)

* Store a `Pagination` instance (the thing which stores, eg, `current_page`, etc.) by [dynamically extending the scope that `paginate` was called on](https://github.com/gadtfly/PaginationDemo/commit/f55d5a4dc1b3e720472cda3e13516e66222cc01b) -- ie, a query which hasn't had `paginate` called on it won't know anything about pagination

  > See ['Object-Specific Classes'](http://ruby-doc.com/docs/ProgrammingRuby/html/classes.html) here... a bit of a hack, but so, fundamentally, is `will_paginate`

Also did some [simple views, with associated `helper`](https://github.com/gadtfly/PaginationDemo/commit/60de8e9a292a528d5c1e668c63414dc6f251bf71), so this is effectively a full solution to the assignment.

----

To test out:

* `git clone` this repo

* `bundle install`

* `rake db:migrate`

* `rake db:seed`

* `rails s`

* Navigate to [http://localhost:3000/things](http://localhost:3000/things)

* Click the pagination links and reflect
