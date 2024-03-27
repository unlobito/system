{ pkgs, ... }: {
  programs.git = {
    enable = true;
    userName = "Harley Watson";
    userEmail = "htw@lobi.to";
    lfs.enable = true;
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = false;
      push.autoSetupRemote = true;
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
