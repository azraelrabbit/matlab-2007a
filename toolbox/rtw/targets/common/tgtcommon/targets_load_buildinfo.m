function buildInfo = targets_load_buildinfo(buildInfoPath)
    % 1 19
    % 2 19
    % 3 19
    % 4 19
    % 5 19
    % 6 19
    % 7 19
    % 8 19
    % 9 19
    % 10 19
    % 11 19
    % 12 19
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    error(nargchk(1.0, 1.0, nargin, 'struct'));
    % 19 22
    % 20 22
    if isempty(buildInfoPath)
        error('A valid BuildInfo object must be specified.');
    end % if
    % 24 27
    % 25 27
    if not(exist(buildInfoPath, 'file'))
        error(horzcat('File "', buildInfoPath, '" does not exist.'));
    end % if
    % 29 32
    % 30 32
    [path, file, ext] = fileparts(buildInfoPath);
    filename = horzcat(file, ext);
    expectedext = '.mat';
    if not(strcmpi(ext, expectedext))
        error(horzcat('Specified filename "', filename, '" is not a "', expectedext, '" file.'));
    end % if
    % 37 40
    % 38 40
    buildObjStruct = load(buildInfoPath);
    % 40 42
    fields = fieldnames(buildObjStruct);
    RTWBuildInfoClass = 'RTW.BuildInfo';
    if ne(length(fields), 1.0)
        error(horzcat('Multiple variables contained in "', buildInfoPath, '", whereas only a single variable of class "', RTWBuildInfoClass, '" is expected.'));
    end % if
    % 46 48
    buildInfo = getfield(buildObjStruct, fields{1.0});
    % 48 50
    if not(strcmp(class(buildInfo), RTWBuildInfoClass))
        error(horzcat('Variable contained in "', buildInfoPath, '", is of class "', class(origBuildObj), '" and not "', RTWBuildInfoClass, '" as expected.'));
    end % if
end % function
