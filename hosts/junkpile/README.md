# junkpile setup

Before the first build on `junkpile`, replace the placeholder hardware configuration:

```bash
cd ~/nixos-dotfiles
nixos-generate-config --show-hardware-config > hosts/junkpile/hardware-configuration.nix
```

Review the generated file, then build the host:

```bash
sudo nixos-rebuild test --flake .#junkpile
sudo nixos-rebuild switch --flake .#junkpile
```

If this is a fresh installation mounted at `/mnt`, generate the configuration with
`nixos-generate-config --root /mnt` and copy
`/mnt/etc/nixos/hardware-configuration.nix` to
`hosts/junkpile/hardware-configuration.nix` before running:

```bash
sudo nixos-install --flake .#junkpile
```
