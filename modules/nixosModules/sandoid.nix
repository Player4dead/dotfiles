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
      };
    };

  };
}
