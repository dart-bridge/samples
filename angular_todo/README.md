# Bridge :heart: Angular

This is an example project where Bridge connects an Angular front end with a Todo Service
back end.

## Try in Dartium
```shell
> git clone https://github.com/dart-bridge/samples
...
> cd samples/angular_todo
> pub get
...
> cp .env.production .env
> dart bridge start
Server started on http://localhost:1337
=
```

Open up [localhost:1337](http://localhost:1337) in Dartium and you should see the app.

## Try without Dartium
After running the above setup, we can build the project

```shell
= build
...
= exit
> dart bridge start --production

```

Open up [localhost:1337](http://localhost:1337) in any browser and you should see the app.

