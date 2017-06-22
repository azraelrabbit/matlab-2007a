function [items, colindx] = addConstraint(this, rowindx, colindx, items, has, prop, label, tooltip)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    if not(has)
        return;
    end % if
    % 11 13
    if lt(nargin, 7.0)
        label = interspace(prop);
        label = horzcat(label(1.0), lower(label(2.0:end)));
    end % if
    % 16 18
    label = sprintf('%s: ', label);
    % 18 20
    tunable = not(isminorder(this));
    % 20 22
    spec_lbl.Name = label;
    spec_lbl.Type = 'text';
    spec_lbl.RowSpan = horzcat(rowindx, rowindx);
    spec_lbl.ColSpan = horzcat(colindx, colindx);
    spec_lbl.Tag = horzcat(prop, 'Label');
    spec_lbl.Tunable = tunable;
    % 27 29
    if gt(nargin, 7.0)
        spec_lbl.ToolTip = tooltip;
    end % if
    % 31 33
    items = cellhorzcat(items{:}, spec_lbl);
    colindx = plus(colindx, 1.0);
    % 34 37
    % 35 37
    spec.Type = 'edit';
    spec.RowSpan = horzcat(rowindx, rowindx);
    spec.ColSpan = horzcat(colindx, colindx);
    spec.ObjectProperty = prop;
    spec.Source = this;
    spec.Mode = true;
    spec.Tag = prop;
    spec.Enabled = this.Enabled;
    spec.Tunable = tunable;
    % 45 47
    colindx = plus(colindx, 1.0);
    % 47 49
    items = cellhorzcat(items{:}, spec);
end % function
