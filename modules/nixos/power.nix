{...}: {
  powerManagement.enable = true;
  services.thermald.enable = true;

  services.mbpfan = {
    enable = true;
    settings.general = {
      low_temp = 55;
      high_temp = 68;
      max_temp = 85;
      min_fan1_speed = 1200;
      max_fan1_speed = 6500;
      polling_interval = 5;
      aggressive = false;
    };
  };

  services.tlp = {
    enable = true;
    settings = {
      START_CHARGE_THRESH_BAT0 = 0;
      STOP_CHARGE_THRESH_BAT0 = 100;
    };
  };
}
