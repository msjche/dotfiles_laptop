#!/bin/bash

nmcli con status | grep -oP '^(([^\s]+\s){1,}[\s]{2,}){4}yes.+$' | grep -oP '(?<=[\s]{2})[^\s]+(?=(\s+[^\s]+){2}\s+yes.*)' | xargs -L1 nmcli con down uuid
