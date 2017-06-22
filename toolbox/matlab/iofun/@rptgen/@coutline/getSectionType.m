function bookType = getSectionType(c)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    if not(strcmp(c.SectionType, 'auto'))
        bookType = c.SectionType;
        return;
    end % if
    % 15 18
    % 16 18
    bookType = 'sect1';
    sectionChild = find(c, '-isa', 'rptgen.rpt_section', 'Active', true, '-not', 'ObjectSection', false, '-not', '-isa', 'rptgen.coutline');
    % 19 25
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    if not(isempty(sectionChild))
        childType = get(sectionChild(1.0), 'SectionType');
        allSect = set(c, 'SectionType');
        childIdx = find(strcmp(allSect, childType));
        if eq(childIdx, 1.0)
            bookType = 'set';
        else
            if eq(childIdx, length(allSect))
                bookType = 'book';
            else
                bookType = allSect{minus(childIdx, 1.0)};
            end % if
        end % if
    end % if
end % function
