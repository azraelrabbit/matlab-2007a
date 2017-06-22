function cs = loop_getContextString(c)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    if strcmp(c.LoopType, 'auto')
        % 9 11
        switch lower(getContextType(rptgen_sf.appdata_sf, c, false))
        case 'machine'
            cs = xlate('All charts in current machine');
        case {'chart','state','object'}
            cs = xlate('Current chart');
        otherwise
            cs = findContextBlocksDesc(rptgen_sl.appdata_sl, c, 'chart');
            % 17 19
        end % switch
    else
        if isempty(c.ObjectList)
            cs = xlate('<no charts selected>');
        else
            cs = rptgen.toString(c.ObjectList, 16.0, ' ');
        end % if
    end % if
end % function
