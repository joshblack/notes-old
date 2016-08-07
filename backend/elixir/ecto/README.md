# Ecto

If you're coming from a traditional ORm background like ActiveRecord, it's common to centralize tasks like database access, query geeneration, and validation in your models.

In Ecto, these are all divided into separate modules:

- `Repo`: provides an interface to execute queries against a database.
- `Model`: provides a struct for you to create instances of a specific type with
- `Changeset`: provide you with model validations

## Models

Models are where we end up creating the structs to represent the data inside of our application. Each model defines the fields or our schema as well as their types, it also identifies and defines the relationships with other models.

Models also handle data validation and type casting with changesets.
