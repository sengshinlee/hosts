#!/bin/bash

declare -g DOMAINS=(
    "action.github.com"
    "api.github.com"
    "atom.io"
    "avatars.githubusercontent.com"
    "avatars0.githubusercontent.com"
    "avatars1.githubusercontent.com"
    "avatars2.githubusercontent.com"
    "avatars3.githubusercontent.com"
    "avatars4.githubusercontent.com"
    "avatars5.githubusercontent.com"
    "avatars6.githubusercontent.com"
    "avatars7.githubusercontent.com"
    "avatars8.githubusercontent.com"
    "bounty.github.com"
    "classroom.github.com"
    "cli.github.com"
    "code.visualstudio.com"
    "codeload.github.com"
    "collector.github.com"
    "desktop.github.com"
    "developer.github.com"
    "docs.github.com"
    "education.github.com"
    "electronjs.org"
    "enterprise.github.com"
    "ghcr.io"
    "ghe.com"
    "gist.github.com"
    "git.io"
    "github.blog"
    "github.co"
    "github.com"
    "github.community"
    "github.dev"
    "github.io"
    "githubapp.com"
    "githubcopilot.com"
    "githubenterprise.com"
    "githubstatus.com"
    "githubuniverse.com"
    "help.github.com"
    "learn.github.com"
    "mac.github.com"
    "octoverse.github.com"
    "pages.github.com"
    "partner.github.com"
    "pkg.github.com"
    "primer.style"
    "raw.githubusercontent.com"
    "resources.github.com"
    "services.github.com"
    "skills.github.com"
    "socialimpact.github.com"
    "support.github.com"
    "thegithubshop.com"
    "training.github.com"
    "uploads.github.com"
    "vscode.dev"
    "vscode.github.com"
    "windows.github.com"
)

function domain2ip() {
    for A_DOMAIN in ${DOMAINS[*]}; do
        AN_IPV4=$(dig ${A_DOMAIN} -4 +short | awk '{ if($0!~"[a-z]") print }' | head -1)
        echo "${AN_IPV4} ${A_DOMAIN}" | tee -a hosts >/dev/null 2>&1
    done
    exit 0
}

function main() {
    if [ -f "hosts" ]; then
        rm hosts
    fi

    domain2ip
}

main
