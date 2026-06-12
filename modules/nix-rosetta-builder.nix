{ inputs, ... }:
{
  # An existing Linux builder is needed to initially bootstrap `nix-rosetta-builder`.
  # If one isn't already available: comment out the `nix-rosetta-builder` module
  # in flake.nix, uncomment this `linux-builder` module, and run `darwin-rebuild switch`:
  # nix.linux-builder.enable = true;

  # Then: uncomment `nix-rosetta-builder`, remove `linux-builder`, and `darwin-rebuild switch`
  # a second time. Subsequently, `nix-rosetta-builder` can rebuild itself.

  # # see available options in module.nix's `options.nix-rosetta-builder`
  nix-rosetta-builder = {
    onDemand = true;
  };
}
