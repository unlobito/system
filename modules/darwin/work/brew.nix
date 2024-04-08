{ ... }: {
  homebrew = {
    taps = [
      {
        name = "mshell/mshell";
        clone_target = "git@github.skyscannertools.net:mshell/homebrew-mshell.git";
        force_auto_update = true;
      }
      "skyscanner/tools"
      "snyk/tap"
    ];

    brews = [
      "aws-sam-cli"
      "cfn-lint"
      "cookiecutter"
      "helm"
      "k9s"
      "kubectx"
      "mshell/mshell/artifactory-cli-login"
      "mshell/mshell/skyscanner-bundle"
      "pinentry"
      "pre-commit"
      "prettier"
      "protobuf"
      "skyscanner/tools/turbolift"
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
