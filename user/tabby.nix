{ ... }: {
  home.file.".tabby-client/agent/config.toml".text = ''
    ## Tabby agent configuration file

    ## Online documentation: https://tabby.tabbyml.com/docs/extensions/configurations
    ## You can uncomment and edit the values below to change the default settings.
    ## Configurations in this file have lower priority than the IDE settings.

    ## Server
    ## You can set the server endpoint and token here.
    [server]
    endpoint = "http://localhost:8080"              # http or https URL
    token = "auth_ac83b6478eed4387acf49fa80400a3ac" # if set, request header Authorization = "Bearer $token" will be added

    ## You can add custom request headers.
    # [server.requestHeaders]
    # Header1 = "Value1" # list your custom headers here
    # Header2 = "Value2" # values can be strings, numbers or booleans

    ## Proxy
    ## You can specify an optional http/https proxy when required, overrides environment variable settings.
    # [proxy]
    # url = "http://your-proxy-server" # the URL of the proxy

    ## Logs
    ## You can set the log level here. The log file is located at ~/.tabby-client/agent/logs/.
    # [logs]
    # level = "silent" # "silent" or "error" or "debug"

    ## Anonymous usage tracking
    ## Tabby collects anonymous usage data and sends it to the Tabby team to help improve our products.
    ## Your code, generated completions, or any sensitive information is never tracked or sent.
    ## For more details on data collection, see https://tabby.tabbyml.com/docs/extensions/configurations#usage-collection
    ## Your contribution is greatly appreciated. However, if you prefer not to participate, you can disable anonymous usage tracking here.
    [anonymousUsageTracking]
    disable = true
  '';
}
