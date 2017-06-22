function parentType = getParentSectionType(c)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    parentType = '';
    c = up(c);
        while not(isempty(c))
        if isa(c, 'rptgen.rpt_section')
            parentType = c.RuntimeSectionType;
            if isempty(parentType)
                parentType = c.getSectionType;
            end % if
            if strcmp(parentType, 'ignore')
                % 18 19
                parentType = '';
            else
                % 21 22
                break
            end % if
        end % if
        c = up(c);
    end % while
end % function
