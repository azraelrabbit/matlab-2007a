function varargout = viewAllFiles(this, filePriority)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    if lt(nargin, 2.0)
        filePriority = 2.0;
    end % if
    % 12 14
    [canView, pkgDir] = isComponentBuilt(this, false);
    % 14 16
    mFiles = [];
    if canView
        try
            mFiles = dir(fullfile(pkgDir, horzcat('@', this.PkgName), horzcat('@', this.ClassName), '*.m'));
        end % try
    end % if
    % 21 23
    if isempty(mFiles)
        if gt(nargout, 0.0)
            varargout{1.0} = canView;
        end % if
        return;
    else
        canView = true;
        if lt(filePriority, 0.0)
            if gt(nargout, 0.0)
                varargout{1.0} = canView;
            end % if
            return;
        else
            hFiles = dir(fullfile(pkgDir, horzcat('@', this.PkgName), horzcat('@', this.ClassName), '*.html'));
            for i=1.0:length(hFiles)
                edit(fullfile(pkgDir, horzcat('@', this.PkgName), horzcat('@', this.ClassName), hFiles(i).name));
            end % for
            xFile = fullfile(pkgDir, horzcat('@', this.PkgName), 'rptcomps2.xml');
            if exist(xFile, 'file')
                edit(xFile);
            end % if
            for i=1.0:length(mFiles)
                edit(fullfile(pkgDir, horzcat('@', this.PkgName), horzcat('@', this.ClassName), mFiles(i).name));
            end % for
            eFile = fullfile(pkgDir, horzcat('@', this.PkgName), horzcat('@', this.ClassName), 'execute.m');
            if exist(eFile, 'file')
                edit(eFile);
            end % if
        end % if
    end % if
end % function
