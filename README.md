# Bikesharing Station Demo

This application emulates several bikestations for the [**BikeMan**](...) project.

The used technique is [Spring Boot](http://projects.spring.io/spring-boot/), and [AngularJS](https://angularjs.org/).

To run the backend, you need the current version of Maven, Postgres and Java JDK 7.

The config is accessable through `application.properties`<br />
(db default config: `datasourceurl=localhost/demostation`, `user=bikesharingdemo`)

You initialize and start the application with `mvn spring-boot:run`. The demo stations are imported automatically into the database (_import.sql_).
