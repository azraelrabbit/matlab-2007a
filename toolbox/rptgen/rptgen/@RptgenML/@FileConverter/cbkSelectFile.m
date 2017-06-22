function fName = cbkSelectFile(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if isempty(this.SrcFileName)
        startFile = fullfile(pwd, '*.xml');
    else
        startFile = this.SrcFileName;
    end % if
    % 13 14
    [fName, pName, filterIdx] = uigetfile(vertcat(cellhorzcat('*.xml', xlate('XML files (*.xml)')), cellhorzcat('*.*', xlate('All Files (*.*)'))), 'Select a Report Generator source file', startFile);
    % 15 19
    % 16 19
    % 17 19
    % 18 19
    if isequal(fName, 0.0) || isequal(pName, 0.0)
        fName = '';
    else
        fName = fullfile(pName, fName);
        this.SrcFileName = fName;
    end % if
end % function
