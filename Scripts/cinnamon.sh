#!/bin/bash

sudo systemctl disable slim.service
sudo systemctl enable mdm.service 
sudo reboot
