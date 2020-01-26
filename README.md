# payslips
[Personio code challenge](https://github.com/mfigand/payslips/blob/master/public/pdf/Payslips%20Exercise.pdf "Personio code challenge")

## Comments
This app was designed, following the clean architecture design pattern.

All requests are managed by an Interactor. A high level layer to extract logic from controllers.

All Data Base operations are handle by a Repository. A layer that allow to decouple the application from the DB.

This permit to extract logic from the Models, allowing to have real unit test DB independent.

In the Models are only defined validations and relationships with other Models.

All renders are managed by a Presenter. This allow to change format without affecting, how to obtain or process data.

Using TDD as software development process, the app achieve 100% of coverage (Simplecov).

In order to follow code best practices, I stick to SOLID principles and for code formatter I analyzed the code with rubocop.

The format of the API responses is based on [JSON:API](https://jsonapi.org/ "JSON:API") convention.

I would have liked to validate the request params with [json-schema](https://github.com/ruby-json-schema/json-schema/tree/master "json-schema"), but
i didn't have enough time.


## Install steps

From root:

Build the image
* docker-compose build

Create the database.
* docker-compose run web rake db:create

Run migrations.
* docker-compose run web rake db:migrate

Run specs
(--rm tell Docker daemon that once its done running, erase everything related to it and save the disk space)
* docker-compose run --rm web rspec

Run rubocop
(--rm tell Docker daemon that once its done running, erase everything related to it and save the disk space)
* docker-compose run --rm web rubocop

Populate DB, by importing payslips from remote file
* docker-compose run web rake download:payslips

Boot the app
* docker-compose up

Things you may want to cover:

* Ruby version '2.5.7'

* System dependencies
  - docker
  - docker-compose