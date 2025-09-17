{ ... }: {
  homebrew = {
    taps = [
      {
        name = "skyscanner/mshell";
        clone_target = "git@github.com:Skyscanner/homebrew-mshell.git";
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
      "pinentry"
      "pre-commit"
      "prettier"
      "protobuf"
      "skyscanner/mshell/artifactory-cli-login"
      "skyscanner/mshell/skyscanner-bundle"
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
