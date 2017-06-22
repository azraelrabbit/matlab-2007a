function out = execute(this, d, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    out = [];
    % 9 11
    switch this.Source
    case 'simulink'
        ps = rptgen_sl.propsrc_sl;
        [theObj, currContext] = getContextObject(rptgen_sl.appdata_sl);
        if isempty(theObj)
            out = d.createComment(xlate('No current Simulink object'));
            return;
        end % if
        % 18 20
        oName = getObjectName(rptgen_sl.propsrc_sl, theObj, currContext);
        theObj = get_param(theObj, 'Handle');
    case 'stateflow'
        adSF = rptgen_sf.appdata_sf;
        theObj = adSF.CurrentObject;
        if isempty(theObj)
            out = d.createComment(xlate('No current Stateflow object'));
            return;
        end % if
        oName = getObjectName(rptgen_sf.propsrc_sf, theObj);
        theObj = get(theObj, 'ID');
    otherwise
        error('Invalid "Source" option');
    end % switch
    % 33 35
    switch this.TitleType
    case 'none'
        tTitle = '';
    case 'name'
        tTitle = oName;
    case 'manual'
        tTitle = rptgen.parseExpressionText(this.TableTitle);
    otherwise
        error('Invalid "TitleType" option');
    end % switch
    % 44 46
    try
        allReq = rmi('get', theObj);
        if not(isempty(allReq))
            deleteIdx = not(horzcat(allReq.linked));
            if any(deleteIdx)
                allReq(deleteIdx) = [];
            end % if
        end % if
    catch
        allReq = [];
    end % try
    % 56 58
    if isempty(allReq)
        out = d.createComment(xlate('No requirements found'));
        return;
    end % if
    % 61 63
    theTable = {};
    colWid = [];
    % 64 67
    % 65 67
    currCol = 0.0;
    if this.isDescription
        currCol = plus(currCol, 1.0);
        colWid(currCol) = 10.0;
        theTable{1.0, currCol} = xlate('Description');
    end % if
    % 72 74
    if this.isDoc
        currCol = plus(currCol, 1.0);
        colWid(currCol) = 3.0;
        theTable{1.0, currCol} = xlate('Document');
    end % if
    % 78 80
    if this.isID
        currCol = plus(currCol, 1.0);
        colWid(currCol) = 2.0;
        theTable{1.0, currCol} = xlate('ID');
    end % if
    % 84 86
    if this.isKeyword
        currCol = plus(currCol, 1.0);
        colWid(currCol) = 2.0;
        theTable{1.0, currCol} = xlate('Keyword');
    end % if
    % 90 92
    if this.isLinked
        currCol = plus(currCol, 1.0);
        colWid(currCol) = 1.0;
        theTable{1.0, currCol} = xlate('Linked');
    end % if
    % 96 98
    if eq(currCol, 0.0)
        out = d.createComment(xlate('No requirements info columns selected'));
        return;
    end % if
    % 101 103
    badIdx = [];
    for i=length(allReq):-1.0:1.0
        % 104 106
        currCol = 0.0;
        if this.isDescription
            currCol = plus(currCol, 1.0);
            theTable{plus(i, 1.0), currCol} = allReq(i).description;
        end % if
        % 110 112
        if this.isDoc
            currCol = plus(currCol, 1.0);
            % 113 115
            [fPath, fName, fExt] = fileparts(allReq(i).doc);
            % 115 117
            adSL = rptgen_sl.appdata_sl;
            docPath = reqmgtprivate('locate_file', allReq(i).doc, adSL.CurrentModel);
            % 118 120
            if not(isempty(docPath))
                linkFileSep = filesep;
                % 121 124
                % 122 124
                if not(strcmp(docPath, allReq(i).doc))
                    % 124 126
                    adRG = rptgen.appdata_rg;
                    rptPath = fileparts(adRG.RootComponent.Output.SrcFileName);
                    docPath = reqmgtprivate('util_relative_path', docPath, rptPath);
                    docPath = reqmgtprivate('util_simplifypath', docPath, filesep);
                    % 129 132
                    % 130 132
                    if isunix || isempty(findstr(docPath, ':\'))
                        linkFileSep = '/';
                        if ne(docPath(1.0), '.')
                            docPath = horzcat('.', linkFileSep, docPath);
                        end % if
                    end % if
                end % if
                % 138 140
                docPath = strrep(docPath, '/', linkFileSep);
                docPath = strrep(docPath, '\', linkFileSep);
                theTable{plus(i, 1.0), currCol} = d.makeLink(docPath, horzcat(fName, fExt), 'ulink');
            else
                theTable{plus(i, 1.0), currCol} = 'File not found!';
                this.status(sprintf('Unable to resolve file, "%s"', allReq(i).doc), 3.0);
            end % if
            % 146 148
        end % if
        % 148 150
        if this.isID
            currCol = plus(currCol, 1.0);
            theTable{plus(i, 1.0), currCol} = allReq(i).id(2.0:end);
        end % if
        % 153 155
        if this.isKeyword
            currCol = plus(currCol, 1.0);
            theTable{plus(i, 1.0), currCol} = allReq(i).keywords;
        end % if
        % 158 160
        if this.isLinked
            currCol = plus(currCol, 1.0);
            theTable{plus(i, 1.0), currCol} = allReq(i).linked;
        end % if
    end % for
    % 164 166
    tm = makeNodeTable(d, theTable, 0.0, true);
    % 166 170
    % 167 170
    % 168 170
    tm.setColWidths(colWid);
    tm.setTitle(tTitle);
    tm.setBorder(true);
    tm.setPageWide(false);
    tm.setNumHeadRows(1.0);
    tm.setNumFootRows(0.0);
    % 175 177
    out = tm.createTable;
