{ pkgs, ... }: {
  programs.git = {
    enable = true;
    lfs.enable = true;
    settings = {
      user = {
        name = "Harley Watson";
        email = "htw@lobi.to";
      };
      init.defaultBranch = "main";
      pull.rebase = false;
      push.autoSetupRemote = true;
      url = {
        "ssh://git@github.skyscannertools.net" = {
          insteadOf = "https://github.skyscannertools.net";
        };
      };
    };

    ignores = [
      ".DS_Store"
      ".direnv"
      ".envrc"
      ".tool-versions"
    ];

    includes = [
      {
        condition = "gitdir:~/w/skyscanner/";
        contents = {
          user = {
            name = "Harley Watson";
            email = "harley.watson@skyscanner.net";
          };
        };
      }
    ];
  };
}
