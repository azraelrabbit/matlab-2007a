function enumType = typeLanguage
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    enumType = 'docbook_language';
    % 8 9
    e = findtype(enumType);
    if isempty(e)
        langCodes = {'ca';'cs';'da';'de';'el';'en';'es';'et';'fi';'fr';'hu';'id';'it';'ja';'ko';'nl';'no';'pl';'pt';'pt_br';'ro';'ru';'sk';'sl';'sv';'zh_cn'};
        % 12 39
        % 13 39
        % 14 39
        % 15 39
        % 16 39
        % 17 39
        % 18 39
        % 19 39
        % 20 39
        % 21 39
        % 22 39
        % 23 39
        % 24 39
        % 25 39
        % 26 39
        % 27 39
        % 28 39
        % 29 39
        % 30 39
        % 31 39
        % 32 39
        % 33 39
        % 34 39
        % 35 39
        % 36 39
        % 37 39
        % 38 39
        langNames = vertcat(cellhorzcat(xlate('Catalan')), cellhorzcat(xlate('Czech')), cellhorzcat(xlate('Danish')), cellhorzcat(xlate('German')), cellhorzcat(xlate('Greek')), cellhorzcat(xlate('English')), cellhorzcat(xlate('Spanish')), cellhorzcat(xlate('Estonian')), cellhorzcat(xlate('Finnish')), cellhorzcat(xlate('French')), cellhorzcat(xlate('Hugarian')), cellhorzcat(xlate('Indonesian')), cellhorzcat(xlate('Italian')), cellhorzcat(xlate('Japanese')), cellhorzcat(xlate('Korean')), cellhorzcat(xlate('Dutch')), cellhorzcat(xlate('Norwegian')), cellhorzcat(xlate('Polish')), cellhorzcat(xlate('Portugese')), cellhorzcat(xlate('Portugese (Brazilian)')), cellhorzcat(xlate('Romanian')), cellhorzcat(xlate('Russian')), cellhorzcat(xlate('Slovak')), cellhorzcat(xlate('Slovenian')), cellhorzcat(xlate('Swedish')), cellhorzcat(xlate('Chinese')));
        % 40 68
        % 41 68
        % 42 68
        % 43 68
        % 44 68
        % 45 68
        % 46 68
        % 47 68
        % 48 68
        % 49 68
        % 50 68
        % 51 68
        % 52 68
        % 53 68
        % 54 68
        % 55 68
        % 56 68
        % 57 68
        % 58 68
        % 59 68
        % 60 68
        % 61 68
        % 62 68
        % 63 68
        % 64 68
        % 65 68
        % 66 68
        % 67 68
        [langNames, sortIdx] = sort(langNames);
        langCodes = langCodes(sortIdx);
        % 70 71
        langNames{plus(end, 1.0)} = xlate('Automatic');
        langCodes{plus(end, 1.0)} = 'auto';
        % 73 74
        e = rptgen.enum(enumType, langCodes, langNames);
    end % if
end % function
