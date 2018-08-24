### What Next?

Now that the application is up and running, we need to get it ready. These are the things I do immediately after installing.

There is a Horizon container, but Horizon isn't currently installed. To install it:

`docker exec -it -u www-data myapp_php_1 composer require laravel/horizon`

`docker exec -it -u www-data myapp_php_1 php artisan vendor:publish --provider="Laravel\Horizon\HorizonServiceProvider"`

`docker restart myapp_horizon_1`

---

`docker run -it --rm -v $(pwd):/var/www/html laravel/node:production npm install`

`docker exec -it -u www-data myapp_php_1 composer require predis/predis`

`docker exec -it -u www-data myapp_php_1 composer require laravel/passport`

`docker exec -it -u www-data myapp_php_1 php artisan migrate`

`docker exec -it -u www-data myapp_php_1 php artisan passport:install`

In **User.php**, use the `HasApiTokens` trait.

```
<?php

namespace App;

use Laravel\Passport\HasApiTokens;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use HasApiTokens, Notifiable;
}
```

Add `Passport::routes();` to **AuthServiceProvider.php**

```
<?php

namespace App\Providers;

use Laravel\Passport\Passport;
use Illuminate\Support\Facades\Gate;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array
     */
    protected $policies = [
        'App\Model' => 'App\Policies\ModelPolicy',
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot()
    {
        $this->registerPolicies();

        Passport::routes();
    }
}
```

In `config/auth.php`, swap out the `token` driver for the `passport` driver in the **api** guarad.

```
'guards' => [
    'web' => [
        'driver' => 'session',
        'provider' => 'users',
    ],

    'api' => [
        'driver' => 'passport',
        'provider' => 'users',
    ],
],
```

`docker exec -it -u www-data myapp_php_1 php artisan make:auth`

`docker exec -it -u www-data myapp_php_1 php artisan vendor:publish --tag=passport-components`

Add this to `resources/assets/js/app.js`:

```
Vue.component('passport-clients', require('./components/passport/Clients.vue'));
Vue.component('passport-authorized-clients', require('./components/passport/AuthorizedClients.vue'));
Vue.component('passport-personal-access-tokens', require('./components/passport/PersonalAccessTokens.vue'));
```

In `app/Http/Kernel.php` add the `CreateFreshApiToken` to the **web** middleware.

```
'web' => [
    // Other middleware...
    \Laravel\Passport\Http\Middleware\CreateFreshApiToken::class,
],
```

Add the test database to `phpunit.xml`.

```
<php>
    <env name="APP_ENV" value="testing"/>
    <env name="CACHE_DRIVER" value="array"/>
    <env name="SESSION_DRIVER" value="array"/>
    <env name="QUEUE_DRIVER" value="sync"/>
    <env name="DB_DATABASE" value="wtffood_testing"/>
</php>
```

---

**Run `npm watch`**

`docker run -it -v $(pwd):/var/www/html laravel/node:production npm install`

If you set `BASE_TAG` in the `.env` before the build process, replace "laravel" with the value of `BASE_TAG`.
