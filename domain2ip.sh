#!/bin/bash

function domain2ip() {
    for A_DOMAIN in ${DOMAINS[*]}; do
        AN_IPV4=$(dig ${A_DOMAIN} -4 +short | awk '{if($0!~"[a-z]")print}' | head -1)
        echo "${AN_IPV4} ${A_DOMAIN}" | tee -a hosts
    done
}

function main() {
    DOMAINS=(
        "api.github.com"
        "atom.io"
        "avatars.githubusercontent.com"
        "avatars0.githubusercontent.com"
        "cam.githubusercontent.com"
        "classroom.github.com"
        "cli.github.com"
        "code.visualstudio.com"
        "codeload.github.com"
        "desktop.github.com"
        "docs.github.com"
        "education.github.com"
        "electronjs.org"
        "gist.github.com"
        "github.blog"
        "github.com"
        "github.community"
        "github.dev"
        "githubapp.com"
        "githubstatus.com"
        "media.githubusercontent.com"
        "octoverse.github.com"
        "pages.github.com"
        "partner.github.com"
        "primer.style"
        "raw.githubusercontent.com"
        "resources.github.com"
        "services.github.com"
        "skills.github.com"
        "socialimpact.github.com"
        "support.github.com"
        "thegithubshop.com"
        "vscode.github.com"
    )

    if [ -f "hosts" ]; then
        rm hosts
    fi

    domain2ip
}

main
