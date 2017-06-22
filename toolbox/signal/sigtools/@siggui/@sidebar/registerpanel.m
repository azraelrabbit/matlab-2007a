function registerpanel(hSB, fcnHndl, label, opts)
    % 1 30
    % 2 30
    % 3 30
    % 4 30
    % 5 30
    % 6 30
    % 7 30
    % 8 30
    % 9 30
    % 10 30
    % 11 30
    % 12 30
    % 13 30
    % 14 30
    % 15 30
    % 16 30
    % 17 30
    % 18 30
    % 19 30
    % 20 30
    % 21 30
    % 22 30
    % 23 30
    % 24 30
    % 25 30
    % 26 30
    % 27 30
    % 28 30
    error(nargchk(3.0, 4.0, nargin));
    % 30 32
    if eq(nargin, 3.0)
        opts = [];
    end % if
    constructors = get(hSB, 'Constructors');
    constructors = cellhorzcat(constructors{:}, fcnHndl);
    set(hSB, 'Constructors', constructors);
    labels = get(hSB, 'Labels');
    labels = cellhorzcat(labels{:}, label);
    set(hSB, 'Labels', labels);
    % 40 42
    thisrender(hSB, 'renderselectionbutton', opts);
end % function
