#!/bin/bash

sudo systemctl disable mdm.service 
sudo systemctl enable slim.service
sudo reboot
