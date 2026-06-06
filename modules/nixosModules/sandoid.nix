{
  flake.nixosModules.sanoid = {

    services.sanoid = {
      enable = true;
      datasets = {
        "zroot/persist" = {
          hourly = 1;
          daily = 1;
          weekly = 7;
          monthly = 30;
          yearly = 20;
        };
        "extern/vault" = {
          hourly = 50;
          daily = 15;
          weekly = 3;
          monthly = 1;
        };
      };
    };

    services.syncoid = {
      # enable = true;
      interval = "daily";
      user = "syncoid";
      commands = {
        "zroot/persist".target = "user@server:zroot/meschipersist";
        "extern/vault".target = "user@server:zromeschivaultt";
      };
    };

  };
}
