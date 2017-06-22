function varargout = setValueSpecial(this, vType, propName, parentNode)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    if lt(nargin, 1.0)
        % 9 11
        varargout{1.0} = vertcat(cellhorzcat('text', xlate('Text')), cellhorzcat('author', xlate('Author')), cellhorzcat('pagenumber', xlate('Page number')), cellhorzcat('chaptertitle', xlate('Chapter title')), cellhorzcat('chapternumbertitle', xlate('Chapter title with number')), cellhorzcat('sectiontitle', xlate('Section title')), cellhorzcat('graphic', xlate('Graphic')), cellhorzcat('comment', xlate('Comment')));
        % 11 21
        % 12 21
        % 13 21
        % 14 21
        % 15 21
        % 16 21
        % 17 21
        % 18 21
        % 19 21
        return
    end
    % 22 25
    % 23 25
    if ishandle(vType)
        % 25 27
        allTypes = vType.getUserData('ListValueSpecial');
        typeIdx = plus(vType.getWidgetValue('ListValueSpecial'), 1.0);
        vType = allTypes{typeIdx};
        if isempty(vType)
            return
        end
    end
    % 33 35
    propNameInvalid = horzcat(propName, 'Invalid');
    % 35 37
    if ~(isempty(this.(propNameInvalid)))
        btnOK = xlate('Revert and append');
        btnCancel = xlate('Cancel');
        btnResult = questdlg(xlate('Current XML text is malformed.  To append this template, the text must be reverted to its last good value.'), xlate('Malformed XML in Value'), btnOK, btnCancel, btnCancel);
        % 40 43
        % 41 43
        switch btnResult
        case btnOK
            this.(propNameInvalid) = '';
            this.ErrorMessage = '';
        otherwise
            return
        end
    end
    % 50 53
    % 51 53
    switch vType
    case 'text'
        n = parentNode.getOwnerDocument.createElement('xsl:text');
        n.appendChild(parentNode.getOwnerDocument.createTextNode(xlate('Confidential')));
        descText = xlate('Custom Text');
    case 'author'
        % 58 60
        n = parentNode.getOwnerDocument.createDocumentFragment;
        nMain = parentNode.getOwnerDocument.createElement('xsl:apply-templates');
        nMain.setAttribute('select', '//author[1]');
        n.appendChild(nMain);
        descText = xlate('Author Name');
        n.appendChild(parentNode.getOwnerDocument.createComment(descText));
    case 'pagenumber'
        n = parentNode.getOwnerDocument.createDocumentFragment;
        nMain = parentNode.getOwnerDocument.createElement('fo:page-number');
        n.appendChild(nMain);
        descText = xlate('Page Number');
        n.appendChild(parentNode.getOwnerDocument.createComment(descText));
    case 'chaptertitle'
        n = parentNode.getOwnerDocument.createDocumentFragment;
        nMain = parentNode.getOwnerDocument.createElement('xsl:apply-templates');
        nMain.setAttribute('select', '.');
        nMain.setAttribute('mode', 'title.markup');
        n.appendChild(nMain);
        descText = xlate('Chapter Title');
        n.appendChild(parentNode.getOwnerDocument.createComment(descText));
    case 'chapternumbertitle'
        % 80 83
        % 81 83
        n = parentNode.getOwnerDocument.createDocumentFragment;
        nMain = parentNode.getOwnerDocument.createElement('xsl:apply-templates');
        nMain.setAttribute('select', '.');
        nMain.setAttribute('mode', 'object.title.markup');
        n.appendChild(nMain);
        descText = xlate('Chapter Title with Number');
        n.appendChild(parentNode.getOwnerDocument.createComment(descText));
    case 'sectiontitle'
        n = parentNode.getOwnerDocument.createDocumentFragment;
        nMain = parentNode.getOwnerDocument.createElement('fo:retrieve-marker');
        nMain.setAttribute('retrieve-class-name', 'section.head.marker');
        nMain.setAttribute('retrieve-position', 'first-including-carryover');
        nMain.setAttribute('retrieve-boundary', 'page-sequence');
        n.appendChild(nMain);
        n.appendChild(parentNode.getOwnerDocument.createTextNode(''));
        descText = xlate('Section Title');
        n.appendChild(parentNode.getOwnerDocument.createComment(descText));
    case 'draft'
        % 100 106
        % 101 106
        % 102 106
        % 103 106
        % 104 106
        n = parentNode.getOwnerDocument.createElement('xsl:call-template');
        n.setAttribute('name', 'draft.text');
        descText = xlate('Draft');
    case 'graphic'
        n = parentNode.getOwnerDocument.createElement('fo:external-graphic');
        % 110 112
        thisParent = this;
        while ~(isa(thisParent, 'RptgenML.StylesheetHeader')) && ~(isempty(thisParent))
            thisParent = thisParent.up;
        end % while
        % 115 118
        % 116 118
        heightAtt = parentNode.getOwnerDocument.createElement('xsl:attribute');
        heightAtt.setAttribute('name', 'height');
        n.appendChild(heightAtt);
        % 120 122
        voElement = parentNode.getOwnerDocument.createElement('xsl:value-of');
        heightAtt.appendChild(voElement);
        if isa(thisParent, 'RptgenML.StylesheetHeader') && strcmp(thisParent.ID, 'footer.content')
            voElement.setAttribute('select', '$region.after.extent');
        else
            voElement.setAttribute('select', '$region.before.extent');
        end
        % 128 133
        % 129 133
        % 130 133
        % 131 133
        nAtt = parentNode.getOwnerDocument.createElement('xsl:attribute');
        nAtt.setAttribute('name', 'src');
        n.appendChild(nAtt);
        % 135 137
        nCall = parentNode.getOwnerDocument.createElement('xsl:call-template');
        nCall.setAttribute('name', 'fo-external-image');
        nAtt.appendChild(nCall);
        % 139 141
        nCall.appendChild(parentNode.getOwnerDocument.createTextNode(char(10.0)));
        % 141 143
        nWith = parentNode.getOwnerDocument.createElement('xsl:with-param');
        nWith.setAttribute('name', 'filename');
        % 144 146
        nCall.appendChild(nWith);
        % 146 148
        nWith.appendChild(parentNode.getOwnerDocument.createTextNode('./logo.bmp'));
        nWith.appendChild(parentNode.getOwnerDocument.createComment(xlate('Enter your graphic name here')));
        % 149 151
        nCall.appendChild(parentNode.getOwnerDocument.createTextNode(char(10.0)));
        % 151 153
        descText = xlate('Graphic');
    otherwise
        n = parentNode.getOwnerDocument.createComment(xlate('Comment text'));
    end
    % 156 158
    parentNode.appendChild(parentNode.getOwnerDocument.createTextNode(char(10.0)));
    parentNode.appendChild(n);
end
