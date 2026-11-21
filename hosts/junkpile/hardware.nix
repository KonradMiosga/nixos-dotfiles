{ ... }: {
  services.xserver.videoDrivers = [ "nvidia" ];

  # Keep the desktop adapter on conservative BlueZ defaults. The experimental
  # settings used by scrappy are intentionally host-specific.
  hardware.bluetooth.settings.General = {
    Experimental = false;
    FastConnectable = false;
  };

  # The RTL8761BU in the TP-Link UB500 loses Bluetooth audio packets when
  # runtime power management suspends the adapter.
  boot.extraModprobeConfig = ''
    options btusb enable_autosuspend=0
  '';

  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="2357", ATTR{idProduct}=="0604", TEST=="power/control", ATTR{power/control}="on"
  '';

  hardware.nvidia = {
    open = true;
    modesetting.enable = true;
    nvidiaSettings = true;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}
