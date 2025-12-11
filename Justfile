@nix:
    NIXPKGS_ALLOW_UNFREE=1 nix develop --impure --command zeditor .

[group('docker')]
pull:
    @docker pull itzg/minecraft-server
    @docker pull ghcr.io/lucko/bytebin
    @docker pull ghcr.io/lucko/bytesocks
    @docker pull ghcr.io/bluemap-minecraft/bluemap
    @docker pull nginx

[group('docker')]
[group('dev')]
[working-directory: 'deploy/docker']
start:
    @docker compose \
        -f compose.yml \
        -f compose.dev.yml up -d

[group('docker')]
[group('dev')]
[working-directory: 'deploy/docker']
logs:
    @docker compose \
        -f compose.yml \
        -f compose.dev.yml logs -fn 100

[group('docker')]
[group('dev')]
[working-directory: 'deploy/docker']
exec:
    docker compose exec -it minecraft rcon-cli

[group('docker')]
[working-directory: 'deploy/docker']
stop:
    @docker compose \
        -f compose.yml \
        -f compose.dev.yml down

[group('dev')]
[working-directory: 'pack']
pack:
    @packwiz refresh
    @packwiz update --all
