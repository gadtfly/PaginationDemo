Rather than merging it into your project only to be immediately thrown away in favour of the actual `will_paginate`, here's a demo in a very simple sample app (just a `Things#index`) that we can go over in isolation.  Check it out [here](https://github.com/gadtfly/PaginationDemo/).

The "plumbing" here is relatively simple:

* Provide `paginate` as a class-method on a model by [manually `extend`ing the model with a module](https://github.com/gadtfly/PaginationDemo/commit/6c8b9c462606d0d04033859e73f1ca36f92eaad3)

* Store pagination info (`page`, `total_pages`, etc.) as an attribute [on the scope/relation](https://github.com/gadtfly/PaginationDemo/commit/22f7741daeb1717bcd9246a4e269714773b219cd) (allowing it to be retrieved in the view helper)

Also includes some [simple views, with associated `helper`](https://github.com/gadtfly/PaginationDemo/commit/60de8e9a292a528d5c1e668c63414dc6f251bf71), so this is effectively a full solution to the assignment.

----

To test out:

* `git clone` this repo

* `bundle install`

* `rake db:migrate`

* `rake db:seed`

* `rails s`

* Navigate to [http://localhost:3000/things](http://localhost:3000/things)

* Click the pagination links and reflect
