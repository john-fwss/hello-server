##### JOHN DEFAULT GOLANG DEVENV #####
{ pkgs, lib, config, inputs, ... }:

{
  # https://devenv.sh/packages/
  packages = with pkgs; [ 
    git
    go
  ];

  # https://devenv.sh/languages/
  # languages.rust.enable = true;

  # https://devenv.sh/processes/
  # processes.cargo-watch.exec = "cargo-watch";

  # https://devenv.sh/services/
  # services.postgres.enable = true;

  # https://devenv.sh/scripts/
  scripts.hello.exec = ''
    echo "-------------------------------------------------"
    echo "--- hello friend, lets write some software :) ---"
    echo "-------------------------------------------------"
    echo ""
    echo ""
  '';

  scripts.printTools.exec = ''
    echo "-------------------------------------------------"
    echo "--------------------- tools ---------------------"
    echo "-------------------------------------------------"
    git --version
    go version
  '';

  enterShell = ''
    hello
    echo ""
    printTools
  '';

  # https://devenv.sh/tests/
  enterTest = ''
    echo "Running tests"
    git --version | grep --color=auto "${pkgs.git.version}"
  '';

  # https://devenv.sh/pre-commit-hooks/
  # pre-commit.hooks.shellcheck.enable = true;

  # See full reference at https://devenv.sh/reference/options/
}
