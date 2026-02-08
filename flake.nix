{
  description = "Simon's nixos configuration";

  inputs = {
    # Nix
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    claude-code.url = "github:sadjow/claude-code-nix";

    # Third party
    minegrub.url = "github:Lxtharia/minegrub-theme";
    mineplymouth.url = "github:nikp123/minecraft-plymouth-theme";
    hyprdynamicmonitors.url = "github:fiffeek/hyprdynamicmonitors";
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    gather-linux.url = "github:simonkoeck/gather-linux";
    g2.url = "github:simonkoeck/g2";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, self, gather-linux, g2, ... }@inputs:
    let
      username = "simon";
      system = "x86_64-linux";
    in
    {
      nixosConfigurations = {
        zephyrus = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/zephyrus
            {
              # 1. Enable unfree packages for your system
              nixpkgs.config.allowUnfree = true;

              # 2. Overlay the firefox-addons onto your system pkgs
              nixpkgs.overlays = [ inputs.firefox-addons.overlays.default ];
            }
          ];
          specialArgs = {
            host = "zephyrus";
            inherit self inputs username gather-linux g2;
          };
        };
      };
    };
}
