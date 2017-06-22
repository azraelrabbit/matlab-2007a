function this = DesignBlock(hBlk, designer)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    error(nargchk(2.0, 2.0, nargin));
    % 9 10
    this = FilterDesignDialog.DesignBlock(hBlk);
    % 11 12
    set(this, 'Block', hBlk);
    % 13 14
    if ischar(designer) || isa(designer, 'function_handle')
        designer = feval(designer, 'OperatingMode', 'Simulink');
        set(this, 'CurrentDesigner', designer);
    else
        set(this, 'CurrentDesigner', designer);
    end % if
end % function
