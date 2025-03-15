{ pkgs, lib, config, inputs, ... }:

{
  languages = {
    javascript = {
      enable = true;
      npm.enable = true;
    };
  };
  processes.dev.exec = "npm run dev";
  cachix.enable = false;
}
