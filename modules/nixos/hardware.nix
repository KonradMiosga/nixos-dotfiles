{
  config,
  lib,
  ...
}: {
  hardware.enableAllFirmware = true;

  boot.extraModprobeConfig = ''
    options hid_apple fnmode=2
  '';

  # Broadcom Wi-Fi. The driver is packaged as "broadcom-sta" and loads as "wl".
  boot.initrd.kernelModules = ["wl"];
  boot.kernelModules = ["wl"];
  boot.extraModulePackages = [config.boot.kernelPackages.broadcom_sta];

  nixpkgs.config.allowInsecurePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "broadcom-sta"
    ];
}
