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

- [ ] Add Flameshot


## Ansible Facts

- MacOS   => `ansible_facts.distribution == "MacOS"`

- ALL     => `ansible_facts.distribution == "Ubuntu"`
- Ubuntu  => `ansible_facts.ansible_env["DESKTOP_SESSION"] == "ubuntu"`
- Xubuntu => `ansible_facts.ansible_env["DESKTOP_SESSION"] == "xubuntu"`
- Budgie  => `ansible_facts.ansible_env["DESKTOP_SESSION"] == "budgie-desktop"`
