function sectionType = getSectionType(c)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    if not(c.ObjectSection) || not(c.Active)
        sectionType = 'ignore';
    else
        if not(isempty(c.RuntimeSectionType))
            sectionType = c.RuntimeSectionType;
        else
            if strcmp(c.SectionType, 'auto')
                typeList = {'book';'chapter';'sect1';'sect2';'sect3';'sect4';'sect5';'simplesect';'none'};
                % 20 28
                % 21 28
                % 22 28
                % 23 28
                % 24 28
                % 25 28
                % 26 28
                sectionType = 'chapter';
                parentType = '';
                p = c;
                    while not(isempty(p))
                    p = p.up;
                    if isa(p, 'rptgen.rpt_section')
                        parentType = p.RuntimeSectionType;
                        if isempty(parentType)
                            parentType = p.getSectionType;
                        end % if
                        if not(strcmp(parentType, 'ignore'))
                            break
                        end % if
                    end % if
                end % while
                if isempty(parentType)
                    parentType = get(get(rptgen.appdata_rg, 'RootComponent'), 'RuntimeSectionType');
                end % if
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
