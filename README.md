# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# Rails Naming Conventions: Article Resource

## Resource: Article

### Model Naming Conventions

- **Model Name:** `article`
- **File Name (snake\_case):** `article.rb`
- **Class Name (PascalCase):** `Article`

### Database Table Naming

- **Table Name:** `articles` (Plural, as per Rails conventions)
- **Columns:**
  - `id` (Auto-generated, unique primary key)
  - `title`
  - `description`

## Creating a Table with Migration

To create the `articles` table, we need to generate a migration file and run it.

### Generate Migration File

```sh
rails generate migration create_articles
```

- This command generates a migration file with a timestamped filename, e.g., `TIMESTAMP_create_articles.rb`.

### Update the Migration File

Modify the generated migration file as needed to define the table structure.

### Run the Migration

```sh
rails db:migrate
```

- This updates the `db/schema.rb` file with the new table structure.

## Updating an Existing Migration

**Note:** Modifying a migration file after running `db:migrate` will not work directly.

### Rollback the Last Migration (Not Preferable)

```sh
rails db:rollback
```

- This reverts the last migration, allowing changes before reapplying `db:migrate`.

### Preferable Way to Update a Migration

1. Generate a new migration file.
   ```sh
   rails generate migration add_column_to_articles
   ```
2. Modify the new migration file with the required changes.
3. Run the migration.
   ```sh
   rails db:migrate
   ```

This approach ensures better tracking and avoids potential database inconsistencies.

## once table created a table now we need a way of communication with this table to our rails application
  => Here Model comes in picture
  => Model Name => Article
     file name => article.rb

          



