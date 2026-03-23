# Scripts

Configuration scripts for devices.

## Getting Started

```
$ sudo apt-get install -y python3 python3-pip
$ pip install virtualenv

# Make sure you're in this 'scripts' directory
$ ~/.local/bin/virtualenv venv
$ source ./venv/bin/activate
(venv) $ pip install -r requirements.txt

(venv) $ ansible-playbook [FILENAME] -K
```

## TODO

- [x] Add Flameshot
- [x] xclip - Linux
- [x] Linux - Remap L_CTRL & L_ALT
- [x] Linux - Remap <CAPS> to Ctrl_L
- [/] Syncthing - MacOS
- [ ] VS Code
- [ ] Linux - appimaged
- [ ] tlp, powertop - Linux


## Ansible Facts

- MacOS   => `ansible_facts.distribution == "MacOS"`

- ALL Ubuntus   => `ansible_facts.distribution == "Ubuntu"`
- Ubuntu        => `ansible_facts.ansible_env["DESKTOP_SESSION"] == "ubuntu"`
- Xubuntu       => `ansible_facts.ansible_env["DESKTOP_SESSION"] == "xubuntu"`
- Budgie        => `ansible_facts.ansible_env["DESKTOP_SESSION"] == "budgie-desktop"`
- Kubuntu       => `ansible_facts.ansible_env["DESKTOP_SESSION"] == "plasma"`
