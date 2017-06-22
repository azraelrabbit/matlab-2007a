function rmcomponent(this, h)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    error(nargchk(2.0, 2.0, nargin));
    % 9 10
    h = ctranspose(h(:));
    % 11 12
    for hindx=h
        if not(isa(hindx, 'siggui.siggui'))
            warning('Signal:sigcontainer:ChildMustBeSiggui', 'Children must inherit from SIGGUI.');
        else
            disconnect(hindx);
        end % if
    end % for
    % 19 22
    % 20 22
    % 21 22
    attachnotificationlistener(this);
end % function
