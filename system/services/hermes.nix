{ config, ... }: {
  services.hermes-agent = {
    enable = true;
    container.enable = true;
    container.backend = "podman";

    settings = {
      model = {
        provider = "custom";
        base_url = "http://100.101.223.8:1234/v1";
        default = "qwen3.5-27b";
      };
      toolsets = [ "all" ];
      max_turns = 100;
      terminal = { backend = "local"; timeout = 180; };
      memory = { memory_enabled = true; user_profile_enabled = true; };
    };

    mcpServers = {
      yagami = {
        url = "http://100.101.223.8:43111/mcp";
      };
      voxtral = {
        url = "http://100.101.223.8:1235/mcp";
      };
    };

    environmentFiles = [ "/run/secrets/hermes_env" ];

    documents = {
      "SOUL.md" = builtins.readFile ./hermes-soul.md;
    };

    addToSystemPackages = true;
  };
}
