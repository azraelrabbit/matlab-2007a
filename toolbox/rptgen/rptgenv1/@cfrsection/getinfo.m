function out = getinfo(c)
    % 1 19
    % 2 19
    % 3 19
    % 4 19
    % 5 19
    % 6 19
    % 7 19
    % 8 19
    % 9 19
    % 10 19
    % 11 19
    % 12 19
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    out = getprotocomp(c);
    % 19 21
    out.Name = xlate('Chapter/Subsection');
    out.Type = 'FR';
    out.Desc = xlate('Groups portions of the report into sections');
    out.ValidChildren = {logical(1)};
    % 24 28
    % 25 28
    % 26 28
    out.att.SectionTitle = xlate('Section Title');
    out.att.isTitleFromSubComponent = logical(0);
    out.att.NumberMode = 'auto';
    out.att.Number = '1';
    % 31 35
    % 32 35
    % 33 35
    out.attx.SectionTitle.String = '';
    out.attx.SectionTitle.isParsedText = logical(1);
    out.attx.isTitleFromSubComponent = struct('String', '', 'enumValues', {{logical(1),logical(0)}}, 'enumNames', {{'Get title from first subcomponent','Custom title: '}}, 'UIcontrol', 'radiobutton');
    % 37 43
    % 38 43
    % 39 43
    % 40 43
    % 41 43
    out.attx.NumberMode = struct('String', '', 'enumValues', {{'auto','manual'}}, 'enumNames', {{'Automatically increment section numbers','Custom number: '}}, 'UIcontrol', 'radiobutton');
    % 43 49
    % 44 49
    % 45 49
    % 46 49
    % 47 49
    out.attx.Number.String = '';
    out.attx.Number.isParsedText = true;
    % 50 54
    % 51 54
    % 52 54
    out.ref.allTypes = vertcat(cellhorzcat('Chapter', xlate('Chapter'), 2.25), cellhorzcat('Sect1', xlate('Section 1'), 1.75), cellhorzcat('Sect2', xlate('Section 2'), 1.5), cellhorzcat('Sect3', xlate('Section 3'), 1.25), cellhorzcat('Sect4', xlate('Section 4'), 1.0), cellhorzcat('Sect5', xlate('Section 5'), 1.0), cellhorzcat('SimpleSect', xlate('Section 6'), 1.0), cellhorzcat('', xlate('No section'), 1.0));
    % 54 63
    % 55 63
    % 56 63
    % 57 63
    % 58 63
    % 59 63
    % 60 63
    % 61 63
end
