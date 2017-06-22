function out = execute(c)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    out = [];
    mdlName = c.zslmethods.Model;
    if isempty(mdlName)
        return
    end
    % 11 13
    sortList = locSortBlocks(mdlName, logical(1));
    % 13 15
    if not(isempty(sortList))
        % 15 17
        if c.att.isBlockType
            typeList = getparam(c.zslmethods, sortList, 'BlockType');
        else
            typeList = {};
        end
        % 21 23
        cellBlocks = {};
        % 23 25
        switch c.att.LinkTo
        case 'System'
            parentList = getparam(c.zslmethods, sortList, 'Parent');
            LinkComponent = c.rptcomponent.comps.cfrlink;
            LinkComponent.att.LinkType = 'Link';
            for i=length(parentList):-1.0:1.0
                LinkComponent.att.LinkID = linkid(c.zslmethods, parentList{i}, 'sys');
                % 31 33
                LinkComponent.att.LinkText = getfullname(sortList(i));
                cellBlocks{i, 1.0} = runcomponent(LinkComponent, 0.0);
            end % for
        case 'Block'
            LinkComponent = c.rptcomponent.comps.cfrlink;
            LinkComponent.att.LinkType = 'Link';
            for i=length(sortList):-1.0:1.0
                LinkComponent.att.LinkID = linkid(c.zslmethods, sortList(i), 'blk');
                % 40 42
                LinkComponent.att.LinkText = getfullname(sortList(i));
                cellBlocks{i, 1.0} = runcomponent(LinkComponent, 0.0);
            end % for
        otherwise
            for i=length(sortList):-1.0:1.0
                cellBlocks{i, 1.0} = getfullname(sortList(i));
            end % for
        end
        % 49 52
        % 50 52
        if strcmp(c.att.RenderAs, 'cfrcelltable')
            for i=length(cellBlocks):-1.0:1.0
                numberList{i, 1.0} = i;
            end % for
            % 55 57
            if c.att.isBlockType
                tableCells = vertcat({'Order','Block Name','Block Type'}, horzcat(numberList, cellBlocks, typeList));
                % 58 60
                tWid = [1.0 5.0 2.0];
            else
                tableCells = vertcat({'Order','Block Name'}, horzcat(numberList, cellBlocks));
                tWid = [1.0 5.0];
            end
            % 64 66
            tableComp = c.rptcomponent.comps.cfrcelltable;
            att = tableComp.att;
            % 67 69
            att.TableTitle = c.att.ListTitle;
            att.TableCells = tableCells;
            att.isBorder = logical(1);
            att.ColumnWidths = tWid;
            att.numHeaderRows = 1.0;
            att.Footer = 'NONE';
            % 74 76
            tableComp.att = att;
            % 76 78
            out = runcomponent(tableComp, 5.0);
        else
            % 79 82
            % 80 82
            ListItems = {};
            for i=length(cellBlocks):-1.0:1.0
                if c.att.isBlockType
                    ParaText = cellhorzcat(cellBlocks{i}, horzcat(' (', typeList{i}, ')'));
                else
                    ParaText = cellBlocks{i};
                end
                ListItems{i} = set(sgmltag, 'tag', 'para', 'data', ParaText);
                % 89 92
                % 90 92
            end % for
            % 92 94
            listComp = c.rptcomponent.comps.cfrlist;
            listComp.att.SourceCell = ListItems;
            listComp.att.ListStyle = 'OrderedList';
            listComp.att.ListTitle = c.att.ListTitle;
            % 97 99
            out = runcomponent(listComp, 5.0);
            % 99 101
        end
    else
        status(c, 'Error - sorted block list not found', 1.0);
        out = '';
    end
end
function bList = locSortBlocks(sysName, isCompile)
    % 107 124
    % 108 124
    % 109 124
    % 110 124
    % 111 124
    % 112 124
    % 113 124
    % 114 124
    % 115 124
    % 116 124
    % 117 124
    % 118 124
    % 119 124
    % 120 124
    % 121 124
    % 122 124
    slErr = sllasterror;
    try
        bList = get_param(sysName, 'SortedList');
    catch
        % 127 130
        % 128 130
        sllasterror([]);
        sllasterror(slErr);
        bList = [];
    end % try
end
