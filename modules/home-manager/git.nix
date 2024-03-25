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
      includeIf = {
        "gitdir:~/w/skyscanner/" = {
          path = "config-skyscanner.inc";
        };
      };
    };
  };


  home.file = {
    ".config/git/config-skyscanner.inc".text = ''
      [user]
        name = Harley Watson
        email = harley.watson@skyscanner.net
    '';
  };
}
