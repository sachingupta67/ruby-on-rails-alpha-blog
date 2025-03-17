# Rails Routes Setup Guide

This document provides a step-by-step guide on how to set up and manage routes in a Ruby on Rails application. Specifically, it focuses on defining routes for resources and limiting them to specific actions.

---

## 1. Understanding Routes in Rails
Routes in Rails map incoming HTTP requests to the appropriate controller actions. By defining routes, you specify how your application responds to client requests.

For example, if your application has a resource called `articles`, you can define routes to handle CRUD (Create, Read, Update, Delete) operations for this resource.

---

## 2. Setting Up Routes for a Resource

### Default Routes for a Resource
To define routes for a resource (e.g., `articles`), use the `resources` method in the `config/routes.rb` file. This will generate all default RESTful routes for the resource.

```ruby
# config/routes.rb
Rails.application.routes.draw do
  resources :articles
end
```

This will create the following routes:
- `GET /articles` => `articles#index` (list all articles)
- `GET /articles/:id` => `articles#show` (show a specific article)
- `GET /articles/new` => `articles#new` (display a form to create a new article)
- `POST /articles` => `articles#create` (create a new article)
- `GET /articles/:id/edit` => `articles#edit` (display a form to edit an article)
- `PATCH/PUT /articles/:id` => `articles#update` (update an article)
- `DELETE /articles/:id` => `articles#destroy` (delete an article)

---

### Limiting Routes to Specific Actions
If you don't need all the default routes, you can limit them using the `only` option. For example, if you only want to allow showing a specific article, you can do:

```ruby
# config/routes.rb
Rails.application.routes.draw do
  resources :articles, only: [:show]
end
```

This will generate only the following route:
- `GET /articles/:id` => `articles#show` (show a specific article)

---

## 3. Validating Routes
After defining your routes, you can validate them using the `rails routes` command. This command displays all the routes defined in your application.

To see the routes in an expanded format, use the `--expanded` flag:

```bash
rails routes --expanded
```

Example output for `resources :articles, only: [:show]`:

```
--[ Route 1 ]-----------------------------------------------------------
Prefix            | article
Verb              | GET
URI               | /articles/:id(.:format)
Controller#Action | articles#show
```

---

## 4. Common Use Cases

### Adding Custom Actions
If you need custom actions (e.g., `publish` for an article), you can define them using the `member` or `collection` block.

```ruby
# config/routes.rb
Rails.application.routes.draw do
  resources :articles do
    member do
      post 'publish' # POST /articles/:id/publish
    end

    collection do
      get 'search' # GET /articles/search
    end
  end
end
```

---

### Nested Resources
If you have nested resources (e.g., `comments` under `articles`), you can define them like this:

```ruby
# config/routes.rb
Rails.application.routes.draw do
  resources :articles do
    resources :comments, only: [:create, :destroy]
  end
end
```

This will generate routes like:
- `POST /articles/:article_id/comments` => `comments#create`
- `DELETE /articles/:article_id/comments/:id` => `comments#destroy`

---

## 5. Best Practices
1. **Limit Routes**: Only define routes that are necessary for your application to avoid unnecessary exposure.
2. **Use RESTful Routes**: Stick to RESTful conventions unless you have a specific reason to deviate.
3. **Keep Routes Organized**: Use `namespace` or `scope` to group related routes.
4. **Validate Routes**: Always check your routes using `rails routes` to ensure they are set up correctly.

---

## 6. Example `routes.rb` File

```ruby
# config/routes.rb
Rails.application.routes.draw do
  # Default routes for articles
  resources :articles, only: [:index, :show, :new, :create]

  # Nested routes for comments
  resources :articles do
    resources :comments, only: [:create, :destroy]
  end

  # Custom action for publishing an article
  resources :articles do
    member do
      post 'publish'
    end
  end

  # Root route
  root 'articles#index'
end
```

---

## 7. Conclusion
Setting up routes in Rails is straightforward and highly customizable. By following RESTful conventions and using the `resources` method, you can efficiently manage your application's routing logic. Always validate your routes using `rails routes` to ensure they are correctly defined.

For more advanced routing options, refer to the [Rails Routing Guide](https://guides.rubyonrails.org/routing.html).