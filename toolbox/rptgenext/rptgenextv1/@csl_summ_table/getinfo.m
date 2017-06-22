function out = getinfo(c)
    % 1 20
    % 2 20
    % 3 20
    % 4 20
    % 5 20
    % 6 20
    % 7 20
    % 8 20
    % 9 20
    % 10 20
    % 11 20
    % 12 20
    % 13 20
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    persistent RPTGEN_GETINFO_STRUCTURE;
    if isempty(RPTGEN_GETINFO_STRUCTURE)
        out = getprotocomp(c);
        % 22 24
        out.Name = xlate('Object Summary Table');
        out.Type = 'SL';
        out.Desc = xlate('Shows properties of several Models, Systems, Blocks, or Signals in one table.');
        % 26 29
        % 27 29
        [out.att, out.attx] = get_summ_attribute(c.rpt_summ_table);
        % 29 31
        out.att.ObjectType = 'Block';
        % 31 33
        out.att.isModelAnchor = logical(0);
        out.att.isSystemAnchor = logical(0);
        % 34 36
        RPTGEN_GETINFO_STRUCTURE = out;
    else
        % 37 39
        out = RPTGEN_GETINFO_STRUCTURE;
    end
end
