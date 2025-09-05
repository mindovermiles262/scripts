# Gnome Terminal

Set themes via dconf

## List Current Profiles

```
dconf dump /org/gnome/terminal/legacy/profiles/:/
```

## Load New Profile

```
dconf load /org/gnome/terminal/legacy/profiles:/ < PROFILE.dconf
```

