About LEPServer
==============

Sometimes you need to deploy a basic PHP web server and don't want/need the overhead of using Chef, Puppet or an alternative configuration management tool. LEPServer addresses this problem. It has been specifically written to configure cloud servers.

LEPServer is based on a LEMP (Linux/Nginx/MySQL/PHP) stack but without a MySQL database which is nearly always installed on a separate server in a production environment.

Database
=======

LEPServer includes the MySQL PHP driver so you can still connect to a MySQL database installed on another server.


Linux
=======

LEPServer expects and has only been tested with Ubuntu 14.04 LTS x64


How to Use:
========

Install Git

        sudo apt-get -y install git-core

Download LEPServer

        git clone git://github.com/group-hub/LEPServer.git
        cd LEPServer

Setup the server

        bash build_server.sh

Credits: LEPServer is loseley based on the open source LEMPress
