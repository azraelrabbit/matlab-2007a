function buildTree(TreeRoot, Package)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    if isa(Package, 'char')
        PkgHandle = findpackage(Package);
        if isempty(PkgHandle)
            % 12 14
            return;
        end % if
    else
        if isa(Package, 'schema.package')
            PkgHandle = Package;
        else
            error('Input must be a package name or handle')
        end % if
        % 21 24
        % 22 24
    end % if
    ClsHandle = findclass(PkgHandle);
    % 25 28
    % 26 28
    for i=1.0:length(ClsHandle)
        TreeRoot.insert(ClsHandle(i));
    end % for
end % function
