 { config, pkgs, ... }:

{
   home.username = "nic";
   home.homeDirectory = "/home/nic";
   home.stateVersion = "25.11";

   programs.fish = {
      enable = true;
      interactiveShellInit = ''
         set fish_greeting 0
    '';
    };
 
   programs.kitty = {
     enable = true;
     settings = {
       confirm_os_window_close = 0;
       background_opacity = "0.9";
     };
   };

    programs.rofi = {
      enable = true;
      package = pkgs.rofi-wayland;
      theme = "solarized_alternate";
};

    wayland.windowManager.sway = {
       enable = true;
       config = {
         terminal = "kitty";
         menu = "rofi -show drun";
         modifier = "Mod4";
         keybindings = let
            mod = "Mod4";
         in pkgs.lib.mkOptionDefault {
             "${mod}+Return" = "exec kitty";
             "${mod}+d" = "exec rofi -show drun";
     
       };
     };
   }   
 }     
