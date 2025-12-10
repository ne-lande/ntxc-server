@nix:
    nix develop --command zeditor .

[working-directory: 'deploy/docker']
launch-dev:
    @docker compose -f compose.yml -f compose.dev.yml up -d
