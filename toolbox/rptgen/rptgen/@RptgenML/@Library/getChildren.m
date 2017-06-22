function libC = getChildren(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    libC(1.0:0.0) = handle(0.0);
    libC = ctranspose(libC);
    % 9 10
    libCat = this.down;
        while not(isempty(libCat))
        if isa(libCat, 'RptgenML.LibraryCategory')
            if libCat.Visible && not(isempty(libCat.down))
                if libCat.Expanded
                    catChildren = getChildren(libCat);
                    libC = vertcat(libC, libCat, catChildren(:));
                else
                    libC(plus(end, 1.0), 1.0) = libCat;
                end % if
            end % if
        else
            % 22 23
            libC(plus(end, 1.0), 1.0) = libCat;
        end % if
        libCat = libCat.right;
    end % while
end % function
