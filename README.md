## Docker Build For Laravel

1. Copy the `docker` directory to your Laravel project's root directory.
2. Copy the `docker-compose.yml` file to your Laravel project's root directory.
3. Add `/database/mysql` to your .gitignore file so that git won't track your database.
4. Run `docker-compose up -d --build` to start your project.

A few notes:
- As per `docker-compose.yml`, the application's web front end will run on port 8010.
- As per `docker-compose.yml`, an instance of Portainer run on port 9001.
- As per `docker-compose.yml` images will be built and tagged as laravel/<containerService>:production.
