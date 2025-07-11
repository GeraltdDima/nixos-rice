{
    programs.wofi = {
        enable = true;

        settings = {
        show = "drun";
        width = "45%";
        height = "40%";
        prompt = "Find ...";
        normal_window=true;
        location = "center";
        gtk-dark=true;
        allow_images=true;
        image_size=32;
        insensitive=true;
        allow_markup=true;
        no_actions=true;
        orientation = "vertical";
        halign = "fill";
        content_halign = "fill";

        };

        style =
        ''
            window {
              background-color: #1a1b26;
            }

            * {
              font-family: "Jetbrains Mono";
              color: #fff;
            }

            #scroll {
              padding: 0.5rem;
            }

            #input {
              background-color: #1a1b26;
              color: #c0caf5;
              outline: none;
              box-shadow: none;
              border: 0;
              border-radius: 0;
              font-size: 1rem;
              padding: 0.5rem;
            }

            #inner-box {
                margin: 0.5rem;
                font-size: 1rem;
            }

            #img {
              margin: 10px 10px;
            }

            #entry {
              border-radius: 0.5rem;
            }

            #entry:selected {
              background-color: #26283b;
              outline: none;
            }

            #text:selected {
              color: white;
            }
        '';
    };
}
