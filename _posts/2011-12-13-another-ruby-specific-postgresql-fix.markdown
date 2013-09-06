---
author: jstarrdewar
date: '2011-12-13 10:54:42'
layout: post
slug: another-ruby-specific-postgresql-fix
status: publish
title: Another (Ruby Specific) PostgreSQL Fix
comments: true
categories:
- Databases
- PostgreSQL
- Ruby
---

If you should get the following error messages:

`could not connect to server: Permission denied (PGError) Is the server running locally and accepting connections on Unix domain socket "/var/pgsql_socket/.s.PGSQL.5432"?`

and/or

`FATAL: lock file "postmaster.pid" already exists HINT: Is another postmaster (PID 592) running in data directory "/usr/local/var/postgres"?`

Try simply uninstalling `gem uninstall pg` and reinstalling `gem install pg` the pg gem. Doing so set things right for me.

This is on OS X Lion with the homebrew postgres package. I believe I got the
error because when I updated my pg gem it somehow didn't pick up the path to
my homebrew postgres and tried to connect to the system one instead, but I
haven't done enough testing to know for sure. At any rate, the problem is
solved now, so my curiosity about the cause of it has waned.