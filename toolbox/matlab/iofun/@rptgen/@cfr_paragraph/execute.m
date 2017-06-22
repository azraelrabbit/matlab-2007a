function out = execute(c, d, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    childComp = c.down;
    % 9 11
    myTitle = '';
    % 11 13
    switch c.TitleType
    case 'subcomp'
        if not(isempty(childComp))
            myTitle = childComp.runComponent(d);
            childComp = childComp.right;
        else
            myTitle = rptgen.parseExpressionText(c.ParaTitle);
        end % if
    case 'specify'
        myTitle = rptgen.parseExpressionText(c.ParaTitle);
    end % switch
    % 23 25
    paraEl = createElement(d, 'para');
    if not(isempty(c.ParaText))
        paraEl.appendChild(createTextNode(d, rptgen.parseExpressionText(c.ParaText)));
        % 27 29
        insertSpace = true;
    else
        insertSpace = false;
    end % if
    % 32 34
    if not(isempty(childComp))
        if insertSpace
            paraEl.appendChild(createTextNode(d, ' '));
        end % if
        paraEl = c.runChildren(d, paraEl, childComp);
    end % if
    % 39 41
    if not(isempty(myTitle))
        out = createElement(d, 'formalpara');
        myTitle = createElement(d, 'title', myTitle);
        out.appendChild(myTitle);
        out.appendChild(paraEl);
    else
        out = paraEl;
    end % if
