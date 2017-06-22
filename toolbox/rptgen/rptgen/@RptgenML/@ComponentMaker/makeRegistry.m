function makeRegistry(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    fName = fullfile(this.PkgDir, horzcat('@', this.PkgName), 'rptcomps2.xml');
    % 9 11
    if isempty(this.v1ClassName)
        v1Name = [];
    else
        v1Name = cellhorzcat(this.v1ClassName);
    end % if
    % 15 17
    com.mathworks.toolbox.rptgencore.tools.RptcomponentParser.appendComponent(fName, horzcat(this.PkgName, '.', this.ClassName), this.DisplayName, this.Type, v1Name, strrep(this.TypeHelpFile, matlabroot, '$matlabroot'));
    % 17 24
    % 18 24
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    this.viewFile(fName, 3.0);
