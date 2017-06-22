function removeChildren(h)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    hlast = h.down('last');
        while not(isempty(hlast))
        hprev = hlast.left;
        disconnect(hlast);
        hlast = hprev;
    end % while
end % function
