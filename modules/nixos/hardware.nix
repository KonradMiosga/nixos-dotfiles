{
  config,
  lib,
  ...
}: {
  hardware.enableAllFirmware = true;

  boot.extraModprobeConfig = ''
    options hid_apple fnmode=2
  '';
hardware.bluetooth = {
  enable = true;
  powerOnBoot = true;
  settings = {
    General = {
      # Shows battery charge of connected devices on supported
      # Bluetooth adapters. Defaults to 'false'.
      Experimental = true;
      # When enabled other devices can connect faster to us, however
      # the tradeoff is increased power consumption. Defaults to
      # 'false'.
      FastConnectable = true;
    };
    Policy = {
      # Enable all controllers when they are found. This includes
      # adapters present on start as well as adapters that are plugged
      # in later on. Defaults to 'true'.
      AutoEnable = true;
    };
  };
};

  # Broadcom Wi-Fi. The driver is packaged as "broadcom-sta" and loads as "wl".
  boot.initrd.kernelModules = ["wl"];
  boot.kernelModules = ["wl"];
  boot.extraModulePackages = [config.boot.kernelPackages.broadcom_sta];

  nixpkgs.config.allowInsecurePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "broadcom-sta"
    ];
}
