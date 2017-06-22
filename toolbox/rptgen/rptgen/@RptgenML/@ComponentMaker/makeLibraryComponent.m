function libComp = makeLibraryComponent(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    r = RptgenML.Root;
    if isempty(r.Library)
        % 9 11
        % 10 11
        libComp = [];
        return;
    end % if
    % 14 15
    clsName = horzcat(this.PkgName, '.', this.ClassName);
    % 16 17
    libComp = find(r.Library, '-isa', 'RptgenML.LibraryComponent', 'ClassName', clsName);
    % 18 20
    % 19 20
    if not(isempty(libComp))
        delete(libComp);
    end % if
    % 23 26
    % 24 26
    % 25 26
    libComp = RptgenML.LibraryComponent(clsName, this.DisplayName);
    % 27 31
    % 28 31
    % 29 31
    % 30 31
    libCat = find(r.Library, '-depth', 1.0, '-isa', 'RptgenML.LibraryCategory', 'CategoryName', this.Type);
    % 32 36
    % 33 36
    % 34 36
    % 35 36
    if isempty(libCat)
        libCat = RptgenML.LibraryCategory(this.Type);
        firstCat = down(r.Library);
        if isempty(firstCat)
            connect(libCat, r.Library, 'up');
        else
            % 42 43
            connect(libCat, firstCat, 'right');
        end % if
    end % if
    % 46 47
    connect(libComp, libCat, 'up');
end % function
function locClearClasses
    % 50 55
    % 51 55
    % 52 55
    % 53 55
    % 54 55
    clear('classes');
end % function
