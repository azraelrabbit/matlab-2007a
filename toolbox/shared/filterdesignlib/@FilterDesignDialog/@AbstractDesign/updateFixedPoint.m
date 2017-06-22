function updateFixedPoint(this, fixedpointmode)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if strcmpi(this.OperatingMode, 'Simulink')
        return;
    end % if
    % 11 12
    if isempty(this.FixedPoint)
        this.FixedPoint = FilterDesignDialog.FixedPoint;
    end % if
    % 15 16
    set(this.FixedPoint, 'Structure', convertStructure(this, this.Structure));
end % function
