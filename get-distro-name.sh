#!/bin/bash
gawk -F= '/^ID/{print $2}' /etc/os-release
