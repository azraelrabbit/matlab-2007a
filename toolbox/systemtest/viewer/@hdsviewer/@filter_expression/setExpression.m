function setExpression(this, expr)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    try
        this.parent.fevalh(expr);
    catch
        error('Invalid expression')
    end % try
    this.expression = expr;
    this.jHandle.setText(expr);
end % function
