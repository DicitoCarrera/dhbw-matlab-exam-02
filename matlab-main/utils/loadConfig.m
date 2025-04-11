function config = loadConfig(path)
    %LOADCONFIG Loads configuration struct from .mat file
    arguments
        path (1,:) char
    end

    config = load(path);
    config = config.config; % Assumes the variable is named "config"
end
