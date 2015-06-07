Docker Image for OTRS
=====================

Features
--------

* Plain OTRS, ITSM isn't included
* A separate MySQL container is required.
* Apache + mod_perl

Credentials
------------

You can access the OTRS using the link: 

 - http://DOCKERHOST:PORT/otrs/index.pl (Agent Interface)
 - http://DOCKERHOST:PORT/otrs/customer.pl (Customer Interface)

Use the following credentials to log in (then change them):

 - login:    root@localhost
 - password: yt7OgnRPZ2a45g8viz8iP3fec5yBDUpsWoNS6X8jL65a7dK0z5u0EMGrd5m2cf5

Run the container
-----------------

Run a MySQL container. For example:

    docker run -dt --name acquisitariat nasqueron/mysql

To use standard database name otrs:

    docker run -dt -p 37080:80 --link acquisitariat:mysql --name otrs nasqueron/otrs

That will expose the OTRS server on the port 37080,
and link to a MySQL container called acquisitariat.

To customize the datatabase name:

    docker run -dt -p 37080:80 --link acquisitariat:mysql --name otrs -eDB_NAME=otrs_acme nasqueron/otrs

Credits
-------

Original authors: Johannes Nickel (hanneshal) <jn@znuny.com> and Roy Kaldung.

Maintainer for this version: Sébastien Santoro aka Dereckson
