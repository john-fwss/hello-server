##### JOHN DEFAULT GOLANG DEVENV #####
{ pkgs, lib, config, inputs, ... }:

{
  # https://devenv.sh/packages/
  packages = with pkgs; [ 
    buf
    git
    gnumake
    go
    gofumpt
    golangci-lint
    gopls
    go-migrate
    grpcurl
    mkdocs
    ngrok
    postgres-lsp
    protoc-gen-go
    protoc-gen-connect-go
    ripgrep
    sqlc
    temporal-cli
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
  '';

  scripts.printTools.exec = ''
    echo "-------------------------------------------------"
    echo "--------------------- tools ---------------------"
    echo "-------------------------------------------------"
    echo buf: "${pkgs.buf.version}"
    echo git: "${pkgs.git.version}"
    echo make: "${pkgs.gnumake.version}"
    echo go: "${pkgs.go.version}"
    echo gofumpt: "${pkgs.gofumpt.version}"
    echo golangci-lint: "${pkgs.golangci-lint.version}"
    echo gopls: "${pkgs.gopls.version}"
    echo migrate: "${pkgs.go-migrate.version}"
    echo grpcurl: "${pkgs.grpcurl.version}"
    echo mkdocs: "${pkgs.mkdocs.version}"
    echo ngrok: "${pkgs.ngrok.version}"
    echo postgres-lsp: "${pkgs.postgres-lsp.version}"
    echo protoc-gen-go: "${pkgs.protoc-gen-go.version}"
    echo protoc-gen-connect-go: "${pkgs.protoc-gen-connect-go.version}"
    echo ripgrep: "${pkgs.ripgrep.version}"
    echo sqlc: "${pkgs.sqlc.version}"
    echo temporal: "${pkgs.temporal-cli.version}"
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
