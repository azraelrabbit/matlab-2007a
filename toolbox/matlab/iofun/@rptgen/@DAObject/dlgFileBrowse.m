function fileName = dlgFileBrowse(dao, propName, fileFilter, varargin)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    if isempty(varargin)
        currVal = get(dao, propName);
        % 12 14
        p = findprop(dao, propName);
        dlgTitle = p.Description;
        if isempty(dlgTitle)
            dlgTitle = propName;
        end % if
        dlgTitle = horzcat(dao.getDisplayLabel, ' : ', dlgTitle);
        % 19 21
        if ischar(fileFilter) && strcmp(fileFilter, '-directory')
            % 21 23
            fileName = uigetdir(currVal, dlgTitle);
            if isequal(fileName, 0.0)
                return;
            end % if
        else
            currVal = rptgen.findFile(currVal, true);
            [fileName, pathName] = uigetfile(fileFilter, dlgTitle, currVal);
            % 29 32
            % 30 32
            if isequal(fileName, 0.0) || isequal(pathName, 0.0)
                return;
            else
                fileName = fullfile(pathName, fileName);
            end % if
        end % if
        % 37 39
        set(dao, propName, fileName);
    else
        fileName = struct('Type', 'pushbutton', 'ToolTip', xlate('Browse...'), 'Name', '...', 'ObjectMethod', 'dlgFileBrowse', 'MethodArgs', cellhorzcat(cellhorzcat(propName, fileFilter)), 'ArgDataTypes', {{'string','mxArray'}}, varargin{:});
        % 41 50
        % 42 50
        % 43 50
        % 44 50
        % 45 50
        % 46 50
        % 47 50
        % 48 50
    end % if
