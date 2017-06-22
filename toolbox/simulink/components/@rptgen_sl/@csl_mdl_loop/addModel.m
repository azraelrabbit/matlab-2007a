function newOption = addModel(this, mdlName)
    % 1 16
    % 2 16
    % 3 16
    % 4 16
    % 5 16
    % 6 16
    % 7 16
    % 8 16
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    if lt(nargin, 2.0)
        newOption = rptgen_sl.rpt_mdl_loop_options;
    else
        if isa(mdlName, 'rptgen_sl.rpt_mdl_loop_options')
            newOption = mdlName;
        else
            if ischar(mdlName)
                newOption = rptgen_sl.rpt_mdl_loop_options('MdlName', mdlName);
            else
                error('Input must be a string or Model Loop Options object');
            end % if
        end % if
    end % if
    connect(newOption, this, 'up');
end % function
