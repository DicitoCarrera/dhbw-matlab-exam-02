function logError(ME)
    %LOGERROR Logs an error to a file with timestamp
    timestamp = datestr(now, 'yyyymmdd_HHMMSS');
    logFile = fullfile('logs', ['error_' timestamp '.txt']);

    if ~exist('logs', 'dir')
        mkdir('logs');
    end

    fid = fopen(logFile, 'w');
    fprintf(fid, 'ERROR OCCURRED:\n');
    fprintf(fid, 'Message: %s\n', ME.message);
    fprintf(fid, 'Stack:\n');
    for k = 1:length(ME.stack)
        fprintf(fid, '  File: %s, Function: %s, Line: %d\n', ...
                ME.stack(k).file, ME.stack(k).name, ME.stack(k).line);
    end
    fclose(fid);
end
