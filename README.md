# README

This README provides a comprehensive guide to setting up and running the application, focusing on the `Article` resource. It covers everything from system dependencies to deployment instructions, with a special emphasis on Rails naming conventions and model interactions.

## Table of Contents

1. [System Dependencies](#system-dependencies)
2. [Ruby Version](#ruby-version)
3. [Configuration](#configuration)
4. [Database Setup](#database-setup)
   - [Database Creation](#database-creation)
   - [Database Initialization](#database-initialization)
5. [Running the Test Suite](#running-the-test-suite)
6. [Services](#services)
7. [Deployment Instructions](#deployment-instructions)
8. [Rails Naming Conventions: Article Resource](#rails-naming-conventions-article-resource)
   - [Model Naming Conventions](#model-naming-conventions)
   - [Database Table Naming](#database-table-naming)
   - [Creating a Table with Migration](#creating-a-table-with-migration)
   - [Updating an Existing Migration](#updating-an-existing-migration)
9. [Model Interactions](#model-interactions)
   - [Using Rails Console](#using-rails-console)
   - [CRUD Operations](#crud-operations)
   - [Validations](#validations)

## System Dependencies

- Ruby
- Rails
- PostgreSQL (or any other database supported by Rails)
- Bundler

## Ruby Version

Ensure you are using the correct Ruby version as specified in the `.ruby-version` or `Gemfile`.

```sh
ruby -v
```

## Configuration

Clone the repository and install dependencies:

```sh
git clone <repository-url>
cd <repository-folder>
bundle install
```

## Database Setup

### Database Creation

Create the database:

```sh
rails db:create
```

### Database Initialization

Run migrations to set up the database schema:

```sh
rails db:migrate
```

## Running the Test Suite

Run the test suite to ensure everything is working correctly:

```sh
rails test
```

## Services

- **Job Queues:** Active Job with Sidekiq
- **Cache Server:** Redis
- **Search Engine:** Elasticsearch

## Deployment Instructions

Deploy the application using Capistrano:

```sh
cap production deploy
```

## Rails Naming Conventions: Article Resource

### Model Naming Conventions

- **Model Name:** `article`
- **File Name (snake_case):** `article.rb`
- **Class Name (PascalCase):** `Article`

### Database Table Naming

- **Table Name:** `articles` (Plural, as per Rails conventions)
- **Columns:**
  - `id` (Auto-generated, unique primary key)
  - `title`
  - `description`

### Creating a Table with Migration

Generate and run a migration to create the `articles` table:

```sh
rails generate migration create_articles
rails db:migrate
```

### Updating an Existing Migration

To update an existing migration, generate a new migration file:

```sh
rails generate migration add_column_to_articles
rails db:migrate
```

## Model Interactions

### Using Rails Console

Start the Rails console:

```sh
rails console
```

### CRUD Operations

- **Create:**

  ```ruby
  article = Article.new(title: "Test Title", description: "Test Description")
  article.save
  ```

- **Read:**

  ```ruby
  Article.all
  Article.find(1)
  Article.first
  Article.last
  ```

- **Update:**

  ```ruby
  article = Article.find(1)
  article.title = "Updated Title"
  article.save
  ```

- **Delete:**

  ```ruby
  article = Article.find(1)
  article.destroy
  ```

### Validations

Add validations to the `Article` model:

```ruby
class Article < ApplicationRecord
  validates :title, presence: true
end
```

Reload the console to apply changes:

```sh
reload!
```

Check for errors:

```ruby
article.errors.full_messages
```

This guide should help you get the application up and running, understand the naming conventions, and interact with the `Article` model effectively.


