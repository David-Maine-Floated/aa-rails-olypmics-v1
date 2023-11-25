# Rails Olympics Practice Part 2 - Building a Rails Project

You have **45 minutes** for this portion of the evaluation.

This evaluation will focus on the creation of a simple CRUD Gardening
application. For this part of the evaluation you will be creating models and
controllers for users, gardens, and flowers.

## File Structure

You will start with a standard Rails file structure that includes pre-written
RESTful routes, HTML views, and specs. **Do not alter any of the spec files.**

## Scoring & Objective

Each passing spec will award one point, for a total of 30 points. This component
of the evaluation is estimated to take **45 minutes**. Your objective is to pass
as many specs as possible.

## Getting Started

Before you begin running the specs, make sure that you create your database:

```sh
rails db:create
```

### Database Configuration

Every time you run `rails db:migrate`, also run `rails db:test:load`.
`db:migrate` only updates the development database; `db:test:load` updates the
test DB schema to mirror the development DB.

You can combine both commands into one:

```sh
rails db:migrate db:test:load
```

### Data Types

You will create migration, models, and controllers for the following data types:

1. `User`s will have a `username` that is a string.
   - A `User`'s `username` will be unique.
2. `Garden`s will have a `name` that is a string, have a `size` that is an
   integer, and belong to a `User` (name this column `garden_owner_id`).
   - A `User` has many `Garden`s, but those `Garden`s must all have unique
     `name`s in regards to that `User`. This uniqueness should be enforced at
     both the database and model levels.
   - The `gardens` table should have only one index.
3. `Flower`s will have a `flower_type` which is a string and will belong to
   both a `User` (name this column `gardener_id`) and a `Garden` (name this
   column `garden_id`).

All foreign keys should be indexed and have a `foreign_key` constraint.
(Remember: **You should have only one index on the `gardens` table**.)

A `User` owns many `Garden`s. A `User` can plant `Flower`s in their own `Garden`
as well as in any other `User`'s `Garden`.

You will only be tested on the migrations, models, and controllers. When writing
strong parameters for your controllers, you can assume all incoming parameters
will be passed in though the body of incoming requests (including foreign keys).

## Specs

As you progress though this evaluation, it is recommended that you run all of
your migrations before attempting any model specs. It is also recommended that
you finish your models and create your controller files before attempting the
controller/request specs.

**Note**: Some of the model specs test the integration of your models through
associations. **Some model specs may accordingly require implementation of more
than one model to pass.**

If a failing spec confuses you, look at the spec file to see if you can discern
what it is asking of you.

As ever, please ask your TAs any questions. If you get stuck or don't know why
something is failing, ask. TAs will let you know whether they can answer your
question, so ask anything.

### Running Specs

- `cd` into the project's root directory
  (__rop/garden_party__)
- `bundle install` to install dependencies
- `bundle exec rspec` to run the entire spec suite
- `bundle exec rspec spec/<spec_file_name>` to run all specs in a given spec
  file
  - for example: `bundle exec rspec spec/models/user_spec.rb`
- `bundle exec rspec spec/<spec_file_name>:<line_number>` to run the spec(s) in
  the block that contains the given line number of a given spec file
  - for example: `bundle exec rspec spec/models/user_spec.rb:1`
