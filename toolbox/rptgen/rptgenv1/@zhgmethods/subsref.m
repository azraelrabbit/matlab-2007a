function B = subsref(A, S)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    hgData = rgstoredata(A);
    % 8 10
    whichField = S(1.0).subs;
    % 10 12
    if not(isstruct(hgData))
        hgData = initialize(A, hgData);
        rgstoredata(A, hgData);
    else
        if not(isfield(hgData, whichField))
            hgData = setfield(hgData, whichField, []);
            rgstoredata(A, hgData);
        end
    end
    B = getfield(hgData, S(1.0).subs);
    if isempty(B)
        B = LocBestGuess(A, whichField);
    end
end
function fieldVal = LocBestGuess(z, whichField)
    % 26 29
    % 27 29
    switch whichField
    case 'Figure'
        fieldVal = get(0.0, 'CurrentFigure');
        if not(isempty(fieldVal))
            % 32 36
            % 33 36
            % 34 36
            currTag = get(fieldVal, 'tag');
            badFigList = excludefiguretags(z);
            if any(strcmp(badFigList, currTag))
                fieldVal = [];
            end
        end
    case 'Axes'
        currFig = get(0.0, 'CurrentFigure');
        fieldVal = get(currFig, 'CurrentAxes');
    case 'Object'
        currFig = get(0.0, 'CurrentFigure');
        fieldVal = get(currFig, 'CurrentObject');
    case 'PreRunOpenFigures'
        fieldVal = findall(allchild(0.0), 'type', 'figure');
    end
end
