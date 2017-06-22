function [urname, uiname] = getUniqueComplexSignalName(this, name)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    realpostfix = hdlgetparameter('complex_real_postfix');
    imagpostfix = hdlgetparameter('complex_imag_postfix');
    % 10 13
    % 11 13
    uname = name;
    nameList = this.getNames;
    % 14 16
    uniq = 1.0;
    uniq_limit = 100000.0;
    names = getComplexNames(uname, realpostfix, imagpostfix);
    % 18 20
    while any(ismember(nameList, names)) && lt(uniq, uniq_limit)
        uname = sprintf('%s_%d', name, uniq);
        uniq = plus(uniq, 1.0);
        names = getComplexNames(uname, realpostfix, imagpostfix);
    end % while
    % 24 26
    if eq(uniq, uniq_limit)
        error(hdlerrormsgid('entitysignalerror'), 'Too many signals with the same name %s (complex) in %s', subsyssig, fp);
    end % if
    % 28 30
    urname = names{1.0};
    uiname = names{2.0};
end % function
function names = getComplexNames(name, realpostfix, imagpostfix)
    % 33 36
    % 34 36
    names = cellhorzcat(horzcat(name, realpostfix), horzcat(name, imagpostfix));
end % function
