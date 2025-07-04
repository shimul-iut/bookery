# Book Management API

This is a Ruby on Rails API application for managing books, genres, users, and book ownership. It provides endpoints for CRUD operations and uses JWT for authentication.

## Table of Contents

- [Ruby Version](#ruby-version)
- [System Dependencies](#system-dependencies)
- [Installation and Setup](#installation-and-setup)
  - [Configuration](#configuration)
  - [Database Setup](#database-setup)
- [Running the Application](#running-the-application)
- [Running the Test Suite](#running-the-test-suite)
- [Project Objectives and Functionalities](#project-objectives-and-functionalities)
- [Folder Structure](#folder-structure)
- [Test Case Patterns](#test-case-patterns)
- [API Endpoints](#api-endpoints)

## Ruby Version

*   Ruby 2.7.2

## System Dependencies

*   Ruby 2.7.2
*   Bundler: A Ruby gem for managing application dependencies. Install with `gem install bundler`.
*   Node.js: For JavaScript runtime (required by Webpacker).
*   Yarn: For JavaScript package management (required by Webpacker).
*   SQLite3: The database used by the application in development and test environments.

## Installation and Setup

1.  **Clone the repository:**
    ```bash
    git clone <repository_url>
    cd <repository_name>
    ```

2.  **Install Ruby dependencies:**
    Ensure you have Ruby 2.7.2 and Bundler installed.
    ```bash
    bundle install
    ```

3.  **Install JavaScript dependencies:**
    Ensure you have Node.js and Yarn installed.
    ```bash
    yarn install
    ```

### Configuration

*   The primary configuration files are located in the `config/` directory.
*   Database configuration is in `config/database.yml`. By default, it's set up for SQLite3.
*   Environment-specific configurations are in `config/environments/`.

### Database Setup

1.  **Create the database:**
    ```bash
    rails db:create
    ```

2.  **Run database migrations:**
    This will set up the database schema.
    ```bash
    rails db:migrate
    ```

3.  **Seed the database (optional):**
    If there are seed data defined in `db/seeds.rb`, you can populate the database with initial data:
    ```bash
    rails db:seed
    ```

## Running the Application

To start the Rails server:

```bash
rails server
```

By default, the application will be accessible at `http://localhost:3000`.

## Running the Test Suite

The project uses RSpec for testing.

1.  **Ensure the test database is prepared:**
    ```bash
    rails db:test:prepare
    ```
    (Often, running `rails db:migrate` will also prepare the test database, but this command ensures it.)

2.  **Run all tests:**
    ```bash
    bundle exec rspec
    ```

3.  **Run a specific test file:**
    ```bash
    bundle exec rspec spec/path/to/your_spec.rb
    ```

4.  **View test coverage:**
    After running tests, open `coverage/index.html` in your browser to see the test coverage report generated by SimpleCov.

## Project Objectives and Functionalities

This API aims to provide a comprehensive solution for managing a book library system. Key functionalities include:

*   **User Management:**
    *   User signup and creation.
    *   User login and JWT-based authentication.
*   **Genre Management:**
    *   CRUD operations (Create, Read, Update, Delete) for book genres.
*   **Book List Management:**
    *   CRUD operations for lists of books. These lists can be associated with genres or book owners.
*   **Book Ownership Management:**
    *   CRUD operations for tracking book ownership by users.
*   **(Potential/WIP) Book Borrowing Management:**
    *   Logic for managing book borrowing (inferred from `BookBorrowersController`).
*   **(Potential/WIP) Logging:**
    *   System for logging application events (inferred from `LogsController`).

## Folder Structure

The project follows standard Ruby on Rails conventions. Key directories include:

*   `app/`: Contains the core application code.
    *   `app/assets/`: Stylesheets, JavaScript files, and images.
    *   `app/auth/`: Custom authentication logic (`AuthenticateUser`, `AuthorizeApiRequest`).
    *   `app/controllers/`: Handles incoming HTTP requests and orchestrates responses. API versioning or namespacing might be done here.
    *   `app/helpers/`: Helper methods for views (less relevant for APIs but can be used by controllers).
    *   `app/jobs/`: Background jobs.
    *   `app/lib/`: Custom library code specific to the application.
    *   `app/mailers/`: Email-related code.
    *   `app/models/`: Represents the application's data and business logic (Active Record models).
    *   `app/views/`: (Primarily for server-rendered HTML, less used in JSON APIs but can be used for mailer templates).
*   `bin/`: Executable scripts for development and deployment (e.g., `rails`, `rake`, `bundle`).
*   `config/`: Application configuration files.
    *   `config/routes.rb`: Defines the application's API endpoints and how they map to controllers.
    *   `config/database.yml`: Database connection settings.
    *   `config/initializers/`: Initialization scripts that run when the application starts.
*   `db/`: Database-related files.
    *   `db/migrate/`: Database migration files that define changes to the database schema.
    *   `db/schema.rb`: A representation of the current database schema.
    *   `db/seeds.rb`: Data to populate the database initially.
*   `lib/`: External libraries or larger modules that are not part of the core `app/` logic.
*   `log/`: Application log files for different environments.
*   `public/`: Static files that can be served directly by the webserver (e.g., error pages).
*   `spec/`: Contains all the tests (RSpec).
    *   `spec/factories/`: FactoryBot definitions for creating test data.
    *   `spec/models/`: Tests for model validations, associations, and methods.
    *   `spec/requests/`: Integration tests for API endpoints. These are the primary tests for an API.
    *   `spec/controllers/`: Tests for controller logic (often covered by request specs in API projects).
    *   `spec/auth/`: Tests for authentication and authorization logic.
    *   `spec/support/`: Helper modules and configurations for tests to keep them DRY.
    *   `spec/rails_helper.rb` & `spec/spec_helper.rb`: Configuration files for RSpec.
*   `storage/`: Used by Active Storage for managing file uploads (if configured).
*   `tmp/`: Temporary files (cache, PIDs, sockets).
*   `vendor/`: Third-party code not managed by Bundler (rarely used).
*   `Gemfile` & `Gemfile.lock`: Define application dependencies (Ruby gems).
*   `package.json` & `yarn.lock`: Define JavaScript dependencies (managed by Yarn/Webpacker).

## Test Case Patterns

The project utilizes RSpec as its primary testing framework, along with several helpful gems:

*   **RSpec:**
    *   Tests are organized by type (models, requests, etc.) within the `spec/` directory.
    *   Focus on **request specs** (`spec/requests/`) for testing API endpoints, as these provide the most comprehensive coverage from request to response.
    *   **Model specs** (`spec/models/`) are used to test validations, associations, scopes, and custom methods on models.
*   **FactoryBot:**
    *   Used for creating test data fixtures in a clean and maintainable way.
    *   Factory definitions are located in `spec/factories/`.
    *   Example: `create(:user)` or `build(:book_list)` in your tests.
*   **Shoulda Matchers:**
    *   Provides concise one-liners for testing common Rails functionality in model specs (e.g., validations, associations).
    *   Example: `it { should validate_presence_of(:title) }` or `it { should belong_to(:user) }`.
*   **Faker:**
    *   Integrated with FactoryBot to generate realistic fake data for test objects (e.g., names, email addresses, paragraphs).
*   **Database Cleaner:**
    *   Ensures a clean database state before each test or test suite run, preventing data leakage between tests. Configuration is typically in `spec/rails_helper.rb`.
*   **SimpleCov:**
    *   Measures test coverage. After running the test suite, an HTML report is generated in the `coverage/` directory, showing which parts of the code are covered by tests.
*   **Controller Spec Helpers / Request Spec Helpers:**
    *   Custom helper modules can be found in `spec/support/` (e.g., `ControllerSpecHelper.rb`, `RequestSpecHelper.rb`). These often include methods for common tasks like parsing JSON responses or handling authentication headers in tests.

## API Endpoints

The main API routes are defined in `config/routes.rb`. Here's a summary:

*   **Authentication:**
    *   `POST /auth/login`: Authenticate a user and receive a JWT.
    *   `POST /signup`: Create a new user.

*   **Genres:**
    *   `GET /genres`: List all genres.
    *   `POST /genres`: Create a new genre.
    *   `GET /genres/:id`: Get details of a specific genre.
    *   `PUT/PATCH /genres/:id`: Update a specific genre.
    *   `DELETE /genres/:id`: Delete a specific genre.

*   **Book Lists (nested under Genres):**
    *   `GET /genres/:genre_id/book_lists`: List all book lists for a specific genre.
    *   `POST /genres/:genre_id/book_lists`: Create a new book list for a specific genre.
    *   `GET /genres/:genre_id/book_lists/:id`: Get details of a specific book list.
    *   `PUT/PATCH /genres/:genre_id/book_lists/:id`: Update a specific book list.
    *   `DELETE /genres/:genre_id/book_lists/:id`: Delete a specific book list.

*   **Users:**
    *   `GET /users`: List all users.
    *   `POST /users`: Create a new user (also covered by `/signup`).
    *   `GET /users/:id`: Get details of a specific user.
    *   `PUT/PATCH /users/:id`: Update a specific user.
    *   `DELETE /users/:id`: Delete a specific user.

*   **Book Owners (nested under Users):**
    *   `GET /users/:user_id/book_owners`: List all book owners for a specific user.
    *   `POST /users/:user_id/book_owners`: Create a new book owner entry for a user.
    *   `GET /users/:user_id/book_owners/:id`: Get details of a specific book owner entry.
    *   `PUT/PATCH /users/:user_id/book_owners/:id`: Update a specific book owner entry.
    *   `DELETE /users/:user_id/book_owners/:id`: Delete a specific book owner entry.

*   **Book Lists (nested under Book Owners):**
    *   `GET /book_owners/:book_owner_id/book_lists`: List all book lists for a specific book owner.
    *   `POST /book_owners/:book_owner_id/book_lists`: Create a new book list for a specific book owner.
    *   `GET /book_owners/:book_owner_id/book_lists/:id`: Get details of a specific book list.
    *   `PUT/PATCH /book_owners/:book_owner_id/book_lists/:id`: Update a specific book list.
    *   `DELETE /book_owners/:book_owner_id/book_lists/:id`: Delete a specific book list.

**Note:** Authenticated endpoints will require a valid JWT in the `Authorization` header (e.g., `Authorization: Bearer <your_jwt>`).
The exact list of protected routes should be verified by checking controller concerns like `AuthorizeApiRequest`.
