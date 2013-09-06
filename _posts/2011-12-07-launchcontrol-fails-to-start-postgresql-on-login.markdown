---
author: jstarrdewar
date: '2011-12-06 15:41:28'
layout: post
slug: launchcontrol-postgresql-failure
status: publish
title: LaunchControl Fails to Start PostgreSQL on Login
comments: true
categories:
- Databases
- PostgreSQL
- Ruby
- Ruby on Rails
---

I just opened my rails app and was immediately greeted with this error:

`PG_ERROR: could not connect to server: No such file or directory Is the server running locally and accepting connections on Unix domain socket "/tmp/.s.PGSQL.5432"? `

OK, so LaunchControl failed to start postgreSQL. Let's start it manually:

`/usr/local/Cellar/postgresql/9.0.4/bin/postgres -D /usr/local/var/postgres -r /usr/local/var/postgres/server.log`

Now I get a more useful error:

`FATAL: could not create shared memory segment: Cannot allocate memory DETAIL: Failed system call was shmget(key=5432001, size=1703936, 03600).`

A quick Google search brings up the solution:
[http://willbryant.net/software/mac_os_x/postgres_initdb_fatal_shared_memory_error_on_leopard](http://willbryant.net/software/mac_os_x/postgres_initdb_fatal_shared_memory_error_on_leopard)
(I'm running Lion, of course, and the solution applies to Snow Leopard as well).

I had set shmall and shmax when I installed postgres (and homebrew does this for you, apparently), but sometimes Mac OS X updates will reset these values. In this case, it appeared to be the latest Safari update that was the culprit (bizarre, right?).