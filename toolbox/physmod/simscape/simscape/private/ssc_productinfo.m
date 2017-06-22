function info = ssc_productinfo
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    persistent INFO;
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    if isempty(INFO)
        INFO = lReadProductInfo;
    end
    % 22 24
    info = INFO;
end
function info = lReadProductInfo
    % 26 34
    % 27 34
    % 28 34
    % 29 34
    % 30 34
    % 31 34
    % 32 34
    directory = fileparts(which(mfilename));
    oldDir = pwd;
    cd(directory);
    directory = pwd;
    cd(matlabroot);
    mlroot = pwd;
    cd(oldDir);
    % 40 45
    % 41 45
    % 42 45
    % 43 45
    directory = strrep(directory, horzcat(mlroot, filesep), '');
    % 45 50
    % 46 50
    % 47 50
    % 48 50
    directory = strrep(directory, horzcat(filesep, 'private'), '');
    % 50 55
    % 51 55
    % 52 55
    % 53 55
    info = ver(directory);
    % 55 57
end
