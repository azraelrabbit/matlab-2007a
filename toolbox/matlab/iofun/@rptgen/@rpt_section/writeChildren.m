function writeChildren(this, d, cStart)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    if lt(nargin, 3.0)
        cStart = this.down;
    end % if
    % 14 15
    adRG = rptgen.appdata_rg;
    % 16 17
    while not(isempty(cStart)) && not(get(adRG, 'HaltGenerate'))
        if isa(cStart, 'rptgen.rptcomponent')
            n = cStart.runComponent(d);
            this.RuntimeSerializer.write(n);
        end % if
        cStart = cStart.right;
    end % while
end % function
