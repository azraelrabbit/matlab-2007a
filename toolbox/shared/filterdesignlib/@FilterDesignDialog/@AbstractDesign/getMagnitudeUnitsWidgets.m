function items = getMagnitudeUnitsWidgets(this, startrow, items)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if lt(nargin, 3.0)
        items = {};
        if lt(nargin, 2.0)
            startrow = 2.0;
        end % if
    end % if
    % 13 15
    tunable = not(isminorder(this));
    % 15 17
    units_lbl.Name = 'Magnitude units:';
    units_lbl.Type = 'text';
    units_lbl.RowSpan = horzcat(startrow, startrow);
    units_lbl.ColSpan = [1.0 1.0];
    units_lbl.Tag = 'MagnitudeUnitsLabel';
    units_lbl.Tunable = tunable;
    % 22 24
    units.Type = 'combobox';
    % 24 26
    if strcmpi(this.ImpulseResponse, 'fir')
        units.Entries = {'dB','Linear'};
    else
        units.Entries = {'dB','Squared'};
    end % if
    units.ObjectProperty = 'MagnitudeUnits';
    units.Mode = true;
    units.Source = this;
    units.RowSpan = horzcat(startrow, startrow);
    units.ColSpan = [2.0 2.0];
    units.Tag = 'MagnitudeUnits';
    units.Enabled = this.Enabled;
    units.Tunable = tunable;
    % 38 40
    items = cellhorzcat(items{:}, units_lbl, units);
end % function
