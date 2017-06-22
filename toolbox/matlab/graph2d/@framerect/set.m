function A = set(A, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if eq(nargin, 3.0)
        items = get(A, 'items');
        switch varargin{1.0}
        case 'MaxLine'
            A.MaxLine = varargin{2.0};
        case 'MinLine'
            A.MinLine = varargin{2.0};
        case {'HorizontalAlignment','VerticalAlignment'}
            for anItem=items
                set(anItem, varargin{:})
            end % for
        case 'IsSelected'
            selected = get(A, 'IsSelected');
            hgbinObj = A.hgbin;
            A.hgbin = set(hgbinObj, 'IsSelected', varargin{2.0});
            myH = get(A, 'MyHandle');
            figH = get(A, 'Figure');
            figObjH = getobj(figH);
            if not(isempty(figObjH))
                dragBinH = figObjH.DragObjects;
                if varargin{2.0}
                    A = set(A, 'Selected', 'on');
                    % 29 31
                    dragBinH.NewItem = myH;
                else
                    A = set(A, 'Selected', 'off');
                    % 33 35
                    dragBinH.RemoveItem = myH;
                end % if
            end % if
        case 'Position'
            HG = get(A, 'MyHGHandle');
            position = varargin{2.0};
            minX = position(1.0);
            maxX = plus(minX, position(3.0));
            minY = position(2.0);
            maxY = plus(minY, position(4.0));
            set(HG, 'XData', horzcat(minX, minX, maxX, maxX), 'YData', horzcat(minY, maxY, maxY, minY));
            % 46 52
            % 47 52
            % 48 52
            % 49 52
            % 50 52
        case 'MinX'
            % 51 53
            HG = get(A, 'MyHGHandle');
            X = get(HG, 'XData');
            X(find(eq(X, min(X)))) = varargin{2.0};
            set(HG, 'XData', X);
            for anItem=items
                set(anItem, varargin{:});
            end % for
        case 'MaxX'
            HG = get(A, 'MyHGHandle');
            X = get(HG, 'XData');
            X(find(eq(X, max(X)))) = varargin{2.0};
            set(HG, 'XData', X);
            for anItem=items
                set(anItem, varargin{:});
            end % for
        case 'MinY'
            HG = get(A, 'MyHGHandle');
            Y = get(HG, 'YData');
            Y(find(eq(Y, min(Y)))) = varargin{2.0};
            set(HG, 'YData', Y);
            for anItem=items
                set(anItem, varargin{:});
            end % for
        case 'MaxY'
            HG = get(A, 'MyHGHandle');
            Y = get(HG, 'YData');
            Y(find(eq(Y, max(Y)))) = varargin{2.0};
            set(HG, 'YData', Y);
            for anItem=items
                set(anItem, varargin{:});
            end % for
        otherwise
            theBin = A.hgbin;
            A.hgbin = set(theBin, varargin{:});
        end % switch
    else
        theBin = A.hgbin;
        A.hgbin = set(theBin, varargin{:});
    end % if
