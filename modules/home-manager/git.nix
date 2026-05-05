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
      mergetool = {
        unityyamlmerge = {
          trustExitCode = false;
          cmd = "'/Applications/Unity/Hub/Editor/2022.3.22f1/Unity.app/Contents/Tools/UnityYAMLMerge' merge -p \"$BASE\" \"$REMOTE\" \"$LOCAL\" \"$MERGED\"";
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
