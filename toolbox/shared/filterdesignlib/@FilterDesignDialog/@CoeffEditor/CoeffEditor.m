function this = CoeffEditor(Hd)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    error(nargchk(1.0, 1.0, nargin));
    % 9 10
    this = FilterDesignDialog.CoeffEditor;
    % 11 12
    set(this, 'FixedPoint', FilterDesignDialog.FixedPoint, 'FilterObject', Hd);
end % function
