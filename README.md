# Development

## Check flake

Check for basic errors.

```bash
nix flake check
```

## Build the config

This builds the entire machine. May take a while to fetch all dependencies.

```bash
nix build .#nixosConfigurations.<machine>.config.system.build.toplevel
```
