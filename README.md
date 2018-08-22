## Docker Build For Laravel

1. Copy the `docker` directory to your Laravel project's root directory.
2. Add `/database/mysql` to your project's `.gitignore` file so that git won't track your database.
3. From the `docker` directory, run `docker-compose up -d --build` to start your project.

**ENVIRONMENT VARIABLES**

The following are environment variables that you can include in your Laravel .env file to control these settings. If these variables are not added to Laravel's `.env` file, the DEFAULT is used.

| VARIABLE | DEFAULT | AFFECTS |
| :---------: | :---------: | :--------- |
| WEB_PORT | 8010 | The web interface port |
| PORTAINER_PORT | 9001 | The Portainer port |
| BASE_TAG | laravel | The tag used for the repository name when building images. This needs to be all lowercase, no spaces |
| TZ | America/Chicago | The timezone used by the mysql build process |

Here are examples of how each of these environment variables would be set in the `.env` file:

```
WEB_PORT=8088
PORTAINER_PORT=9002
BASE_TAB=mycoolthing
TZ=America/Denver
```
