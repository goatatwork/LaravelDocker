## Docker Environment For Laravel

1. Copy the `docker` directory to your Laravel project's root directory.

2. Copy the `docker-compose.yml` to your Laravel project's root directory.

3. Add `/database/mysql` to your project's `.gitignore` file so that git won't track your database.

4. Configure the Laravel `.env` file.

    - set `DB_DATABASE`, `DB_USERNAME`, and `DB_PASSWORD`. When the **mysql** container is started, it will create this database, if it is not already present. Database files will be located in `/database/mysql` under the project root.

        ```
        DB_DATABASE=myappdb
        DB_USERNAME=admin
        DB_PASSWORD=secretpasswordtext
        ```

    - Set `DB_HOST` and `REDIS_host` to their respective service names found in `docker-compose.yml`.

        ```
        DB_HOST=mysql
        REDIS_HOST=redis
        ```

    - Set all of the following to `redis`:

        ```
        BROADCAST_DRIVER=redis
        CACHE_DRIVER=redis
        SESSION_DRIVER=redis
        QUEUE_DRIVER=redis
        ```

    - See the **ADDITIONAL ENVIRONMENT VARIABLES** section below for other optional settings.

4. Any SQL commands you place into `docker/mysql/docker-entrypoint-initdb.d/createdb.sql` will be executed upon creation as well. This is a good place to have your `dbname_testing` database created *(optionally used by phpunit.xml for testing)*. There are examples in that file.

6. Run `docker-compose up -d --build` to start your project. This should be executed from the Laravel project's root directory.

---

You can now visit your application in a browser at the WEB_PORT specified *(8010 by default)*

**ADDITIONAL ENVIRONMENT VARIABLES**

The following are environment variables that you can include in your Laravel .env file to control certain aspects of the build process and the operation of your application. If these variables are not added to Laravel's `.env` file, the DEFAULT is used.

| VARIABLE | DEFAULT | DESCRIPTION |
| :---------: | :---------: | :--------- |
| WEB_PORT | 8010 | The web interface port |
| PORTAINER_PORT | 9001 | The Portainer port |
| BASE_TAG | laravel | The tag used for the repository name when building images. This needs to be all lowercase, no spaces |
| TZ | America/Chicago | The timezone used by the mysql build process |

Here are examples of how each of these environment variables would be set in the `.env` file:

```
WEB_PORT=8088
PORTAINER_PORT=9002
BASE_TAG=mycoolthing
TZ=America/Denver
```
