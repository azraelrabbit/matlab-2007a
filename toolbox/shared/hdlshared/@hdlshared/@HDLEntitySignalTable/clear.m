function clear(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    hSignal = this.down;
        while not(isempty(hSignal))
        disconnect(hSignal);
        hSignal = hSignal.right;
    end % while
    % 12 20
    % 13 20
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    this.reset;
end % function
