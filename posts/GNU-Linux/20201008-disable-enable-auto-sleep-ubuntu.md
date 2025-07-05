---
title:  "Disable/Enable Auto Sleep"
date:   2020-10-08 12:13
tags: [linux, ubuntu]
category: Archive
description: ""
---
# Cek Status
 `systemctl status sleep.target`

# Disable Auto Sleep
 `sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target`

# Enable Auto Sleep
 `sudo systemctl unmask sleep.target suspend.target hibernate.target hybrid-sleep.target`