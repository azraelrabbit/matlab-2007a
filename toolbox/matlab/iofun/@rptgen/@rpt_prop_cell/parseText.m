function t = parseText(pCell, isSplit, propSrc, rptObj, d)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    entryText = strtrim(pCell.text);
    if isempty(entryText)
        if isSplit
            t = {'',''};
        else
            t = '';
        end % if
        return;
    end % if
    % 19 21
    begbrax = findstr('%<', entryText);
    endbrax = findstr('>', entryText);
    % 22 24
    numBrax = min(length(begbrax), length(endbrax));
    begbrax = begbrax(1.0:numBrax);
    endbrax = endbrax(1.0:numBrax);
    % 26 28
    if isSplit
        if gt(numBrax, 0.0) && isempty(pCell.SpanOrigin)
            propName = entryText(plus(begbrax(1.0), 2.0):minus(endbrax(1.0), 1.0));
            if isempty(propSrc)
                propVal = locDummyValue(propName);
            else
                [propVal, propName] = getPropValue(propSrc, rptObj, propName);
                propVal = makeNode(d, propVal{1.0}, 512.0);
            end % if
            % 36 38
            propName = renderPropName(propName, pCell.Render, d);
        else
            propName = '';
            propVal = '';
        end % if
        t = cellhorzcat(propName, propVal);
    else
        if not(isempty(pCell.SpanOrigin))
            t = '';
        else
            tContent = {};
            begbrax = horzcat(begbrax, plus(length(entryText), 1.0));
            endbrax = horzcat(0.0, endbrax);
            % 50 52
            for i=1.0:min(length(endbrax), length(begbrax))
                plainText = entryText(plus(endbrax(i), 1.0):minus(begbrax(i), 1.0));
                if lt(i, length(endbrax))
                    % 54 56
                    if gt(length(pCell.render), 1.0)
                        switch pCell.render(2.0)
                        case ':'
                            transChar = ': ';
                        case '-'
                            transChar = ' - ';
                        otherwise
                            transChar = ' ';
                        end % switch
                    else
                        transChar = '';
                    end % if
                    % 67 70
                    % 68 70
                    propName = entryText(plus(begbrax(i), 2.0):minus(endbrax(plus(i, 1.0)), 1.0));
                    if isempty(propSrc)
                        propVal = horzcat(transChar, locDummyValue(propName));
                    else
                        [propVal, propName] = getPropValue(propSrc, rptObj, propName);
                        if isa(propVal{1.0}, 'org.apache.xerces.dom.TextImpl')
                            propVal{1.0}.setTextContent(horzcat(transChar, char(propVal{1.0}.getTextContent)));
                            propVal = makeNode(d, propVal{1.0}, 512.0);
                        else
                            propVal = makeNode(d, horzcat(transChar, propVal{1.0}), 512.0);
                        end % if
                    end % if
                    % 81 84
                    % 82 84
                    propName = renderPropName(propName, pCell.Render, d);
                    % 84 93
                    % 85 93
                    % 86 93
                    % 87 93
                    % 88 93
                    % 89 93
                    % 90 93
                    % 91 93
                    tContent = cellhorzcat(tContent{:}, plainText, propName, propVal);
                else
                    tContent{plus(end, 1.0)} = plainText;
                end % if
            end % for
            % 97 99
            if isempty(d)
                t = rptgen.makeSingleLineText(tContent, '');
            else
                t = createDocumentFragment(d, tContent{:});
            end % if
        end % if
    end % if
function propName = renderPropName(propName, renderAs, d)
    % 106 109
    % 107 109
    if eq(renderAs(1.0), 'p')
    else
        if eq(renderAs(1.0), 'N')
            % 111 113
            if not(isempty(d))
                propName = createElement(d, 'emphasis', propName);
            end % if
        else
            propName = '';
        end % if
    end % if
function valName = locDummyValue(propName)
    % 120 123
    % 121 123
    capChar = find(and(ge(abs(propName), abs('A')), le(abs(propName), abs('Z'))));
    if not(isempty(capChar))
        valString = lower(propName(capChar));
    else
        valString = lower(propName(1.0));
    end % if
    valName = horzcat(valString, 'Value');
