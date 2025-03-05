{
# docker (rootless)
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
    daemon.settings = {
      data-root = "/mnt/extern/docker";
    };
  };
  users.users.player4dead.extraGroups = [ "docker" ];
}
