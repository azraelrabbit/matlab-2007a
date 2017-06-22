function out = execute(this, d, varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    adSL = rptgen_sl.appdata_sl;
    objH = adSL.getContextObject;
    % 12 13
    if isempty(objH)
        % 14 15
        this.status('No current object for snapshot');
        out = [];
        return;
    end % if
    % 19 20
    objH = get_param(objH, 'Object');
    % 21 23
    % 22 23
    out = this.captureDialog(d, objH);
end % function
