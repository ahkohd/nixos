{ ... }: {
  services.glance.enable = true;
  services.glance.settings = {
    server = {
      host = "0.0.0.0";
      port = 8081;
    };
    pages = [{
      name = "Home";
      columns = [
        {
          size = "small";
          widgets = [
            {
              type = "calendar";
              firstDayOfWeek = "monday";
            }
            {
              type = "rss";
              limit = 10;
              collapseAfter = 3;
              cache = "12h";
              feeds = [
                {
                  url = "https://selfh.st/rss/";
                  title = "selfh.st";
                  limit = 4;
                }
                { url = "https://ciechanow.ski/atom.xml"; }
                {
                  url = "https://www.joshwcomeau.com/rss.xml";
                  title = "Josh Comeau";
                }
                { url = "https://samwho.dev/rss.xml"; }
                {
                  url = "https://ishadeed.com/feed.xml";
                  title = "Ahmad Shadeed";
                }
              ];
            }
            {
              type = "twitch-channels";
              channels = [
                "theprimeagen"
                "j_blow"
                "piratesoftware"
                "cohhcarnage"
                "christitustech"
                "EJ_SA"
              ];
            }
          ];
        }
        {
          size = "full";
          widgets = [
            {
              type = "group";
              widgets = [ { type = "hacker-news"; } { type = "lobsters"; } ];
            }
            {
              type = "videos";
              channels = [
                "UCXuqSBlHAE6Xw-yeJA0Tunw" # Linus Tech Tips
                "UCR-DXc1voovS8nhAvccRZhg" # Jeff Geerling
                "UCsBjURrPoezykLs9EqgamOA" # Fireship
                "UCBJycsmduvYEL83R_U4JriQ" # Marques Brownlee
                "UCHnyfMqiRRG1u-2MsSQLbXA" # Veritasium
                "UC8Q7XEy86Q7T-3kNpNjYgwA" # InternetHistorian & Incognito Mode
              ];
            }
            {
              type = "group";
              widgets = [
                {
                  type = "reddit";
                  subreddit = "technology";
                  showThumbnails = true;
                }
                {
                  type = "reddit";
                  subreddit = "neovim";
                  showThumbnails = true;
                }
                {
                  type = "reddit";
                  subreddit = "selfhosted";
                  showThumbnails = true;
                }
              ];
            }
          ];
        }
        {
          size = "small";
          widgets = [
            {
              type = "weather";
              location = "London, United Kingdom";
              units = "metric";
              hourFormat = "12h";
            }
            {
              type = "markets";
              markets = [
                {
                  symbol = "SPY";
                  name = "S&P 500";
                }
                {
                  symbol = "BTC-USD";
                  name = "Bitcoin";
                }
                {
                  symbol = "NVDA";
                  name = "NVIDIA";
                }
                {
                  symbol = "AAPL";
                  name = "Apple";
                }
                {
                  symbol = "MSFT";
                  name = "Microsoft";
                }
                {
                  symbol = "FIG";
                  name = "Figma";
                }
              ];
            }
            {
              type = "releases";
              cache = "1d";
              repositories =
                [ "glanceapp/glance" "neovim/neovim" "tauri-apps/tauri" ];
            }
          ];
        }
      ];
    }
      ];
  };
}
