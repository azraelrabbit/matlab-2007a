function fName = getSectionFileName(this, adRG)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if lt(nargin, 2.0)
        adRG = rptgen.appdata_rg;
    end % if
    % 12 13
    fileInfo = adRG.getImgName('xfrag', this.RuntimeSectionType);
    this.RuntimeRelativeFileName = fileInfo.relname;
    fName = fileInfo.fullname;
end % function
