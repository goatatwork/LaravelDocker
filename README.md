## Docker Build For Laravel

1. Copy the `docker` directory to your Laravel project's root directory.
2. Copy the `docker-compose.yml` file to your Laravel project's root directory.
3. Add `/database/mysql` to your .gitignore file so that git won't track your database.
4. Run `docker-compose up -d --build` to start your project.

A few notes:
- As per `docker-compose.yml`, the application's web front end will run on port 8010.
- As per `docker-compose.yml`, an instance of Portainer run on port 9001.
- Tags: When built, images will be tagged as laravel/\<containerService\>:production. Optionally, if you include a `BASE_TAG` setting in your `.env` file, that value will be used as the base tag name for the images. If you choose this option, make sure the name you use for the value of `BASE_TAG` is all lowercase letters and no spaces.
- The timezone for the mysql container is set to America/Chicago. If you need to change this, include a TZ variable in your `.env` file before building. *Example: TZ=America/Chicago*
