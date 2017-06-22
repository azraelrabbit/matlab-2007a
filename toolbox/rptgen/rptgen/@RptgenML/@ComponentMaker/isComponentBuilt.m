function [classExists, pkgDir, pkgExists] = isComponentBuilt(this, forcePkgDir)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    pkgDir = this.PkgDir;
    if isdir(fullfile(pkgDir, horzcat('@', this.PkgName)))
        pkgExists = true;
        classExists = exist(fullfile(pkgDir, horzcat('@', this.PkgName), horzcat('@', this.ClassName), 'schema.m'), 'file') || exist(fullfile(pkgDir, horzcat('@', this.PkgName), horzcat('@', this.ClassName), 'schema.p'), 'file');
        % 18 20
        return
    end
    % 21 24
    % 22 24
    dirInfo = what(horzcat('@', this.PkgName));
    % 24 26
    for i=1.0:length(dirInfo)
        if not(isempty(find(strcmp(dirInfo(i).m, 'schema.m')))) || not(isempty(find(strcmp(dirInfo(i).p, 'schema.p'))))
            % 27 29
            pkgDir = fileparts(dirInfo(i).path);
            pkgExists = true;
            classExists = any(strcmp(dirInfo(i).classes, this.ClassName));
            return
        end
    end % for
    % 34 36
    classExists = false;
    pkgExists = false;
    % 37 39
    if not(isdir(pkgDir)) && gt(nargin, 1.0) && forcePkgDir
        pkgDir = pwd;
    end
end
