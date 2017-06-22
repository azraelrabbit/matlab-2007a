function h = db_locale(lang)
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
    h = rpt_xml.db_locale;
    % 12 13
    if gt(nargin, 0.0)
        set(h, 'Language', lang);
    end % if
end % function
