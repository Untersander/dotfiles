{
  config,
  lib,
  pkgs,
  ...
}:
# 
# for configurable home-manager modules see:
# https://github.com/nix-community/home-manager/blob/master/modules/modules.nix
{
  home.nixpkgs.overlays = [
    (self: super: {
      # Add your own overlays here.
      # See https://nixos.wiki/wiki/Overlays
      # Enable unfree packages
      
    })
  ];
  
  # Enable the Home Manager and set up the home directory.
  home.packages = with pkgs; [
    # Install nixpkgs
    exa # pretty ls

    # Install dmg applications versioned by niv from your `nix/sources.json` file.
    # See `nix develop -c niv show` on the root of your flake.
    nivApps.keytty-dmg
  ];

  # enable at least one shell. as for any other program, see customizable options at:
  # https://github.com/nix-community/home-manager/blob/master/modules/programs/<program>.nix
  programs.zsh.enable = true;
  programs.bash.enable = true;
  programs.bat.enable = true; # cat clone with syntax highlighting and git integration
  # programs.vscode.enable = true;
  
}
