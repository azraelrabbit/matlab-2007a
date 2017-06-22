function B = subsref(A, S)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    d = rgstoredata(A);
    % 14 16
    if ~(isstruct(d))
        d = initialize(A);
    end
    % 18 20
    if strcmp(S(1.0).subs, 'comps')
        if ~(isfield(d, 'comps'))
            d.comps = [];
        end
        % 23 25
        if gt(length(S), 1.0)
            d.comps = VerifyFieldComps(d.comps, S(2.0).subs);
        end
    else
        d = VerifyField(d, S(1.0).subs);
    end
    % 30 32
    B = builtin('subsref', d, S);
    % 32 34
    rgstoredata(A, d);
end
function d = VerifyField(d, whichField)
    % 36 39
    % 37 39
    % 38 40
    if (~(isfield(d, whichField))) | (isempty(builtin('subsref', d, substruct('.', whichField))))
        switch whichField
        case 'ReportDirectory'
            d.ReportDirectory = pwd;
        case 'ReportFilename'
            d.ReportFilename = 'Unnamed';
        case 'ReportExt'
            d.ReportExt = 'html';
        case 'Format'
            d.Format = 'html';
        case 'ImageDirectory'
            % 50 54
            % 51 54
            % 52 54
            d = VerifyField(d, 'ReportDirectory');
            d = VerifyField(d, 'ReportFilename');
            d = VerifyField(d, 'ReportExt');
            % 56 59
            % 57 59
            dirName = horzcat(d.ReportFilename, '_', d.ReportExt, '_', 'files');
            % 59 61
            mkdirOK = mkdir(d.ReportDirectory, dirName);
            if eq(mkdirOK, 1.0)
                d.ImageDirectory = fullfile(d.ReportDirectory, dirName);
            else
                if eq(mkdirOK, 2.0)
                    d.ImageDirectory = fullfile(d.ReportDirectory, dirName);
                else
                    % 67 69
                    % 68 70
                    warning('Could not create Report Images directory.');
                    d.ImageDirectory = d.ReportDirectory;
                end
            end
        case 'ImagePreface'
            % 74 76
            d = VerifyField(d, 'ImageDirectory');
            d.ImagePreface = fullfile(d.ImageDirectory, 'image');
        otherwise
            % 78 81
            % 79 81
            % 80 82
            freshD = initialize(rptcomponent);
            thisSubs = substruct('.', whichField);
            d = setfield(d, whichField, getfield(freshD, whichField));
        end
    end
end
function rgdc = VerifyFieldComps(rgdc, cName)
    % 88 91
    % 89 91
    if (~(isfield(rgdc, cName))) | (~(ishandle(getfield(rgdc, cName))))
        try
            rgdc = setfield(rgdc, cName, eval(cName));
        catch
            error('Invalid component name requested');
        end % try
    else
        % 97 100
        % 98 100
        p = getfield(rgdc, cName);
        c = get(p, 'UserData');
        i = getinfo(c);
        c = subsasgn(c, substruct('.', 'att'), i.att);
        c = subsasgn(c, substruct('.', 'x'), i.x);
        c = subsasgn(c, substruct('.', 'ref'), i.ref);
        set(p, 'UserData', c);
    end
end
