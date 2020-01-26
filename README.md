# payslips
[Personio code challenge](https://github.com/mfigand/payslips/blob/master/public/pdf/Payslips%20Exercise.pdf "Personio code challenge")

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

Populate DB
Importing payslips from remote file
* docker-compose run web rake download:payslips

Boot the app
* docker-compose up

Things you may want to cover:

* Ruby version '2.5.7'

* System dependencies
  - docker
  - docker-compose