{ ... }: {
  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    extraOptions = [
      "--all"
      "--color=always"
      "--group-directories-first"
      "--header"
      "--level=1"
      "--long"
      "--tree"
    ];
    git = true;
    icons = "always";
  };
}
