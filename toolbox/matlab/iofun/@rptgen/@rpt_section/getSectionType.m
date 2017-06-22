function sectionType = getSectionType(c)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    if not(c.Active)
        sectionType = 'ignore';
    else
        if not(isempty(c.RuntimeSectionType))
            sectionType = c.RuntimeSectionType;
        else
            if strcmp(c.SectionType, 'auto')
                typeList = {'book';'chapter';'sect1';'sect2';'sect3';'sect4';'sect5';'simplesect';'none'};
                % 16 24
                % 17 24
                % 18 24
                % 19 24
                % 20 24
                % 21 24
                % 22 24
                sectionType = 'chapter';
                parentType = c.getParentSectionType(c);
                if not(isempty(parentType))
                    parentTypeIdx = find(strcmp(typeList, parentType));
                    if not(isempty(parentTypeIdx))
                        thisTypeIdx = min(plus(parentTypeIdx, 1.0), length(typeList));
                        sectionType = typeList{thisTypeIdx};
                    end % if
                end % if
            else
                sectionType = c.SectionType;
            end % if
        end % if
    end % if
end % function
