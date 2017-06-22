function addcomponent(hParent, hChildren)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    error(nargchk(2.0, 2.0, nargin));
    % 11 12
    hChildren = ctranspose(hChildren(:));
    % 13 14
    for hindx=hChildren
        if not(isa(hindx, 'siggui.siggui'))
            warning('Signal:sigcontainer:ChildMustBeSiggui', 'Children must inherit from SIGGUI.');
        else
            connect(hParent, hindx, 'down');
        end % if
    end % for
    % 21 24
    % 22 24
    % 23 24
    attachnotificationlistener(hParent);
end % function
