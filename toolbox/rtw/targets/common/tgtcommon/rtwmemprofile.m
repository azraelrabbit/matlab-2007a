function rtwmemprofile(varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    switch nargin
    case 0.0
        model = bdroot;
        if strcmp(model, '')
            disp('Unable to locate a model, specify a model name.');
            return;
        end % if
    case 1.0
        model = varargin{1.0};
    otherwise
        disp('Specify one model name');
        return;
    end % switch
    % 20 22
    try
        load_system(model);
    catch
        disp(horzcat('Unable to locate model: ', model));
        return;
    end % try
    [dummy, gensettings] = rtwprivate('getSTFInfo', model);
    % 28 31
    % 29 31
    builddir = gensettings.RelativeBuildDir;
    if ne(exist(builddir, 'dir'), 7.0)
        disp('Cannot find RTW build directory.');
        return;
    end % if
    savedpwd = pwd;
    cd(builddir);
    try
        if ne(exist('htmlreport.m', 'file'), 2.0)
            disp('Cannot find file ''htmlreport'' in RTW build directory.');
            return;
        end % if
        htmlreport;
        % 43 46
        % 44 46
    end % try
    cd(savedpwd);
