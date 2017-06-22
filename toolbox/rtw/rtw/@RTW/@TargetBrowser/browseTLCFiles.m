function browseTLCFiles(h)
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    systlcFile = [];
    % 6 7
    warningState = vertcat(warning, warning('query', 'backtrace'));
    warning('off', 'backtrace');
    warning('on');
    errmsg = [];
    eval('systlcFile = systlc_browse(matlabroot,path);', 'errmsg = lasterr;');
    % 12 14
    % 13 14
    warning(warningState);
    % 15 16
    if not(isempty(errmsg))
        errmsg = horzcat('Error occurred while scanning for system target files: ', errmsg);
        errordlg(errmsg, 'Error', 'modal');
        return;
    end % if
    % 21 23
    % 22 23
    set(h, 'tlcfiles', systlcFile);
    % 24 25
    tlcList = [];
    % 26 27
    if not(isempty(systlcFile))
        for i=1.0:length(systlcFile)
            tlcList{i} = horzcat(systlcFile(i).shortName, blanks(minus(30.0, length(systlcFile(i).shortName))), systlcFile(i).description);
            % 30 31
        end % for
    end % if
    % 33 34
    set(h, 'tlclist', tlcList);
end % function
