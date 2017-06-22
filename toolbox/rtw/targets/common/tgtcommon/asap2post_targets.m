function asap2post_targets(ASAP2File, MAPFile, PerlFile)
    % 1 37
    % 2 37
    % 3 37
    % 4 37
    % 5 37
    % 6 37
    % 7 37
    % 8 37
    % 9 37
    % 10 37
    % 11 37
    % 12 37
    % 13 37
    % 14 37
    % 15 37
    % 16 37
    % 17 37
    % 18 37
    % 19 37
    % 20 37
    % 21 37
    % 22 37
    % 23 37
    % 24 37
    % 25 37
    % 26 37
    % 27 37
    % 28 37
    % 29 37
    % 30 37
    % 31 37
    % 32 37
    % 33 37
    % 34 37
    % 35 37
    if lt(nargin, 3.0)
        PerlFile = 'asap2post.pl';
    end
    % 39 42
    % 40 42
    [ASAP2Dir, ASAP2FileName] = local_fileparts(ASAP2File);
    % 42 45
    % 43 45
    [MAPDir, MAPFileName] = local_fileparts(MAPFile);
    if ~(strcmp(ASAP2Dir, MAPDir))
        MAPFileName = fullfile(MAPDir, MAPFileName);
    end
    % 48 51
    % 49 51
    oldDir = cd;
    cd(ASAP2Dir);
    % 52 55
    % 53 55
    result = perl(PerlFile, ASAP2FileName, MAPFileName);
    % 55 58
    % 56 58
    cd(oldDir);
    % 58 61
    % 59 61
    disp(result)
end
function [directory, fileName] = local_fileparts(fileNameIn)
    % 63 80
    % 64 80
    % 65 80
    % 66 80
    % 67 80
    % 68 80
    % 69 80
    % 70 80
    % 71 80
    % 72 80
    % 73 80
    % 74 80
    % 75 80
    % 76 80
    % 77 80
    % 78 80
    if eq(exist(fileNameIn), 2.0)
        % 80 83
        % 81 83
        [directory, fileName, ext] = fileparts(fileNameIn);
        fileName = horzcat(fileName, ext);
        if (isempty(directory)) | (isempty(ext))
            % 85 88
            % 86 88
            [directory, fileName, ext] = fileparts(which(fileNameIn));
            fileName = horzcat(fileName, ext);
        else
            if exist(horzcat(cd, filesep, fileNameIn))
                directory = horzcat(cd, filesep, directory);
            end
        end
    else
        error(horzcat('Unable to find file: ', fileNameIn));
    end
end
