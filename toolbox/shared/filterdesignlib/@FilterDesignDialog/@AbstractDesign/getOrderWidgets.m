function varargout = getOrderWidgets(this, row, allowsMinOrd)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if lt(nargin, 3.0)
        allowsMinOrd = true;
    end % if
    % 10 12
    col = 1.0;
    % 12 15
    % 13 15
    if allowsMinOrd
        % 15 18
        % 16 18
        [ordermode_lbl, ordermode] = getWidgetSchema(this, 'OrderMode', 'Order mode: ', 'combobox', row, col);
        % 18 22
        % 19 22
        % 20 22
        ordermode.DialogRefresh = true;
        % 22 24
        col = plus(col, 2.0);
        % 24 26
        orderWidgets = cellhorzcat(ordermode_lbl, ordermode);
    else
        orderWidgets = {};
    end % if
    % 29 32
    % 30 32
    [order_lbl, order] = getWidgetSchema(this, 'Order', 'Order: ', 'edit', row, col);
    % 32 35
    % 33 35
    if allowsMinOrd && isminorder(this)
        order_lbl.Enabled = false;
        order.Enabled = false;
        % 37 42
        % 38 42
        % 39 42
        % 40 42
        order = rmfield(order, 'ObjectProperty');
    end % if
    % 43 45
    orderWidgets = cellhorzcat(orderWidgets{:}, order_lbl, order);
    % 45 49
    % 46 49
    % 47 49
    if gt(nargout, 1.0)
        varargout = orderWidgets;
    else
        varargout = cellhorzcat(orderWidgets);
    end % if
end % function
