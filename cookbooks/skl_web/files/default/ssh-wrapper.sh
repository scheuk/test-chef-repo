#!/usr/bin/env bash
/usr/bin/env ssh -o "StrictHostKeyChecking=no" -i "/srv/git_temp/ssh_git_deploy.pem" "$@"
