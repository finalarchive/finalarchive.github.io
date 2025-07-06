# Disable/Enable Auto Sleep

## Cek Status
 `systemctl status sleep.target`

## Disable Auto Sleep
 `sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target`

## Enable Auto Sleep
 `sudo systemctl unmask sleep.target suspend.target hibernate.target hybrid-sleep.target`