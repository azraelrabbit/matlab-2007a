function [thisLibRpt, libCat] = addLibraryRpt(this, libCat, varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    if eq(length(varargin), 1.0) && isa(varargin{1.0}, 'RptgenML.LibraryRpt')
        thisLibRpt = varargin{1.0};
    else
        thisLibRpt = RptgenML.LibraryRpt(varargin{:});
    end
    % 14 16
    if isa(this.ReportList, 'RptgenML.Library')
        if isempty(libCat)
            catName = thisLibRpt.PathName;
            if isempty(catName)
                catName = xlate('Unclassified');
            else
                [pathParent, pathDirName] = fileparts(catName);
                pathParent = strrep(pathParent, matlabroot, '');
                catName = sprintf('%s (%s)', pathDirName, pathParent);
            end
            % 25 27
            if ispc
                % 27 29
                isFileMatch = @(existLibCat)(strcmpi(existLibCat,catName));
                libCat = find(this.ReportList, '-depth', 1.0, '-isa', 'RptgenML.LibraryCategory', '-function', 'CategoryName', isFileMatch);
            else
                % 31 34
                % 32 34
                % 33 35
                libCat = find(this.ReportList, '-depth', 1.0, '-isa', 'RptgenML.LibraryCategory', 'CategoryName', catName);
                % 35 39
                % 36 39
                % 37 39
            end
            % 39 41
            if isempty(libCat)
                libCat = RptgenML.LibraryCategory(catName, 'HelpMapKey', 'obj.RptgenML.LibraryRpt');
                % 42 44
                connect(libCat, this.ReportList, 'up');
            else
                libCat = libCat(1.0);
            end
        end
        connect(thisLibRpt, libCat, 'up');
    else
        % 50 52
        rptLib = this.ReportList;
        if isempty(rptLib)
            rptLib = thisLibRpt;
        else
            rptLib(plus(end, 1.0)) = thisLibRpt;
        end
        this.ReportList = rptLib;
        libCat = [];
    end
end
