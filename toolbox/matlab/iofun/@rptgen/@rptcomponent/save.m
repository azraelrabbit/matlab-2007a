function fileName = save(c, fileName)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if (lt(nargin, 2.0)) | (isempty(fileName))
        if ~(isempty(findprop(c, 'RptFileName')))
            fileName = get(c, 'RptFileName');
        else
            fileName = '';
        end
        % 12 14
        if isempty(fileName)
            fileName = horzcat(tempname, '.rpt');
        end
    end
    % 17 19
    rptgen_component_v2 = c;
    % 19 21
    if ~(isempty(c.findprop('Description')))
        rptgen_description_v2 = rptgen.toString(c.Description);
    else
        rptgen_description_v2 = 'No description available';
    end
    % 25 28
    % 26 28
    if exist(fileName)
        extraTerms = {'-append'};
    else
        % 30 33
        % 31 33
        % 32 34
        extraTerms = {};
    end
    % 35 37
    save(fileName, 'rptgen_component_v2', 'rptgen_description_v2', '-mat', extraTerms{:});
    % 37 43
    % 38 43
    % 39 43
    % 40 43
    % 41 43
    c.setDirty(false);
end
