function out = traverseTabs(this, d, dlgH, imNode)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    if isa(imNode, 'imTabBar')
        out = d.createDocumentFragment;
        tabIdx = 0.0;
        tabChild = imNode.down;
            while not(isempty(tabChild))
            % 15 18
            % 16 18
            % 17 18
            imNode.setTab(tabIdx);
            % 19 21
            % 20 21
            childOut = traverseTabs(this, d, dlgH, tabChild);
            if isempty(childOut)
                % 23 25
                % 24 25
                try
                    out.appendChild(this.gr_makeGraphic(d, dlgH));
                catch
                    this.status('Unable to take snapshot', 2.0);
                    this.status(lasterr, 5.0);
                end % try
            else
                % 32 33
                out.appendChild(childOut);
            end % if
            % 35 36
            tabIdx = plus(tabIdx, 1.0);
            tabChild = tabChild.right;
        end % while
    else
        % 40 41
        out = [];
        % 42 43
        nodeChild = imNode.down;
            while not(isempty(nodeChild))
            % 45 46
            childOut = traverseTabs(this, d, dlgH, nodeChild);
            if not(isempty(childOut))
                if isempty(out)
                    out = childOut;
                else
                    % 51 52
                    out.appendChild(childOut);
                end % if
            end % if
            nodeChild = nodeChild.right;
        end % while
    end % if
end % function
