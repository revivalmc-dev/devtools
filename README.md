# revival-dev

In this repository, all tools required to setup a proper minecraft plugin development
workflow are bundled together.

## Requirements

- `docker`
- `docker-compose`

## Start a development environment

To start a Minecraft server using Paper, and soon a database directly linked
to it, just type `make`.

`make help` can be issued to get more useful commands to monitor the environment.

`make fclean` can be used to shutdown the environment.

## Dev server specs

The RAM which is allocated to the JVM through the use of -Xms -Xmx can be
modified by editing the `JVM_XMS` and `JVM_XMX` environment variables in
`./src/docker-compose.yml`.

`make re` will be needed to apply the changes.

## Plugin Builder

For convenience, a small script called `pluginbuilder.sh` is available. It uses
the docker image `revivalmc-dev/pluginbuilder` which already bundles the JDK16
and a working version of apache maven.

The pluginbuilder can be used like so: `./pluginbuilder.sh <path/to/plugin/src>`.

The `pom.xml` file used by maven in order to build the project must be at the root
of the specified repository.

Dependencies downloaded by maven are cached in `/root/.m2` **in the container**, but this
folder is in reality bind-mounted to `$PWD/.m2` on your host system (assuming you're at the root of this repo).

That way maven will only download dependencies once, even if the build is done inside a docker container each
time.

## Database connection (postgresql)

A postgresql instance is deployed in the cluster when `make` is issued. The DB
data is stored in `postgres_data`, which is bind-mounted in the container.

Default user: `postgres`
Default password: `dev`
Hostname (from inside the cluster ONLY) : `postgres`
