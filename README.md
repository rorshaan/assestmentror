# Task Management System using Ruby on Rails

Welcome to the Task Management System built with Ruby on Rails! This application provides a set of APIs to manage tasks, their statuses, and other related functionalities such as assignment, progress tracking, and task statistics.

## Features

1. **Create Task**: Create a new task with a title, description, and due date.
2. **Update Task**: Update task's status.
3. **Delete Task**: Remove a task from the system.
4. **List All Tasks**: Retrieve a list of all tasks.
5. **Get Tasks by Status**: Filter tasks based on their status.
6. **Get Completed Tasks**: Fetch completed tasks.
7. **Get Tasks Statistics**: Obtain statistics on total tasks, completed tasks.

## Implementation Details

- **Database Design**: Utilizes sqlite3(MySQL) to store task and user entities.
- **API Endpoints**: Designed following RESTful principles for ease of use and integration.
- **Error Handling**: Comprehensive error handling and appropriate responses for error scenarios.
- **Data Validations**: Robust validations to maintain data integrity and consistency.
- **Security**: Measures to secure APIs and prevent unauthorized access.

## Getting Started

To start using the Task Management System, follow these steps:

1. Clone the repository to your local machine.
2. Install dependencies using Bundler: `bundle install`.
3. Configure the database settings in `config/database.yml` to match your environment.
4. Run migrations to create necessary database tables: `rails db:migrate`.
5. Start the Rails server: `rails server`.
6. You can now access the API endpoints and manage tasks efficiently within your application.
