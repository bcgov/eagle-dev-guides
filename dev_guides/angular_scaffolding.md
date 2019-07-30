## Code scaffolding

Run `ng generate component component-name` to generate a new component. You can also use `ng generate directive|pipe|service|class|module`.

### Example: Generate a customer component

```
ng g c customer
```

### Example: Generate a directive: search-box

```
ng g d search-box
```

### Example: Generate a service: general-data

```
ng g s general-data
```

Angular will give out a warning line after this command:

> WARNING Service is generated but not provided, it must be provided to be used

After generating a service, we must go to its owning module and add the service to the `providers` array.

### Example: Generate a service and include it in a module automatically

```
ng g s general-data2 -m app.module
```

### Example: Generate a class, an interface and enum

```
# class
ng g cl models/customer

# interface
ng g i models/person

# enum
ng g enum models/gender
```

### Example: Generate a pipe

```
ng g pipe shared/init-caps
```

## Generate a module

Create a login directory and generate a login module in that directory.

```
ng g module login/login.module
```

## Add/Generate Routing Features

Generate a module called admin and add routing feature to it.

```
ng g module admin --routing
```

## Running Tests

### Unit tests
  
Set up via Karma, Jasmine:
1. Run `ng test` to execute the unit tests via [Karma](https://karma-runner.github.io).

### End-to-end tests

Set up with Protractor:
1. Run `ng e2e` to execute the end-to-end tests via [Protractor](http://www.protractortest.org/).
1. Before running the tests make sure you are serving the app via `ng serve`.

## Change aspects of the application

### Change style dialect

```
ng set default.styleExt css
```

## Regenerate a brand new project with routing and scss options

```
ng new my-app --routing --style scss
```

## Getting Help

1. To get more help on the Angular CLI use `ng help` or go check out the [Angular CLI README](https://github.com/angular/angular-cli/blob/master/README.md).
1. `ng doc component` to look up documentation for features.
1. `ng serve --help` to look up doc for `ng serve` command.