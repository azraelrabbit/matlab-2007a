function [labelSchema, widgetSchema] = getWidgetSchema(this, prop, label, type, row, col)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    labelSchema.Name = label;
    labelSchema.Type = 'text';
    labelSchema.RowSpan = horzcat(row, row);
    labelSchema.ColSpan = horzcat(col, col);
    labelSchema.Tag = sprintf('%sLabel', prop);
    % 15 16
    widgetSchema.Type = type;
    widgetSchema.ObjectProperty = prop;
    widgetSchema.Source = this;
    widgetSchema.Mode = true;
    widgetSchema.RowSpan = horzcat(row, row);
    widgetSchema.ColSpan = plus(horzcat(col, col), 1.0);
    widgetSchema.Tag = widgetSchema.ObjectProperty;
    widgetSchema.Enabled = this.Enabled;
end % function
