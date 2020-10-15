---
layout: post
title:  "Disable/Enable Auto Sleep"
date:   2020-10-08 15:21
categories: [linux, ubuntu]
permalink: /:year/:month/:title
---
# Cek Status
 `systemctl status sleep.target`

# Disable Auto Sleep
 `sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target`

# Enable Auto Sleep
 `sudo systemctl unmask sleep.target suspend.target hibernate.target hybrid-sleep.target`