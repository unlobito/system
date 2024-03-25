{ ... }: {
  homebrew = {
    enable = true;

    taps = [
      {
        name = "mshell/mshell";
        clone_target = "git@github.skyscannertools.net:mshell/homebrew-mshell.git";
        force_auto_update = true;
      }
      "snyk/tap"
    ];

    brews = [
      "aws-sam-cli"
      "cfn-lint"
      "k9s"
      "kubectx"
      "mshell/mshell/artifactory-cli-login"
      "mshell/mshell/skyscanner-bundle"
      "pinentry"
      "protobuf"
      "snyk/tap/snyk"
      "sonar-scanner"
      "vegeta"
    ];

    casks = [
      "intellij-idea"
      "meetingbar"
      "visualvm"
    ];
  };
}
