function A = set(A, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    myBin = A.Objects;
    % 9 11
    lArgin = varargin;
        while ge(length(lArgin), 2.0)
        prop = lArgin{1.0};
        val = lArgin{2.0};
        % 14 16
        lArgin = lArgin(3.0:end);
        % 16 18
        switch prop
        case 'NewItem'
            myBin.NewItem = val;
        case 'EraseMode'
            editlineObj = A.editline;
            A.editline = set(editlineObj, prop, val);
            for anObjH=myBin.Items
                set(anObjH, prop, val);
            end % for
        case 'XYData'
            oldX = get(A, 'XData');
            oldY = get(A, 'YData');
            editlineObj = A.editline;
            A.editline = set(editlineObj, 'XData', val{1.0}, 'YData', val{2.0});
            newX = get(A, 'XData');
            newY = get(A, 'YData');
            % 33 35
            dX = minus(newX, oldX);
            dY = minus(newY, oldY);
            dX = dX(find(dX));
            dY = dY(find(dY));
            fMove = or(eq(length(dX), 4.0), eq(length(dY), 4.0));
            if fMove
                for anObjH=myBin.Items
                    X = get(anObjH, 'XData');
                    Y = get(anObjH, 'YData');
                    if not(isempty(dX))
                        X = plus(X, dX(1.0));
                    end % if
                    if not(isempty(dY))
                        Y = plus(Y, dY(1.0));
                    end % if
                    set(anObjH, 'XYData', cellhorzcat(X, Y));
                end % for
            else
                width = range(oldX);
                height = range(oldY);
                left = min(oldX);
                bottom = min(oldY);
                for anObjH=myBin.Items
                    X = get(anObjH, 'XData');
                    Y = get(anObjH, 'YData');
                    if not(isempty(dX))
                        X = plus(X, mrdivide(mtimes(dX(1.0), minus(mean(X), left)), width));
                    end % if
                    if not(isempty(dY))
                        Y = plus(Y, mrdivide(mtimes(dY(1.0), minus(mean(Y), bottom)), height));
                    end % if
                    set(anObjH, 'XYData', cellhorzcat(X, Y));
                    % 66 68
                end % for
            end % if
        case {'XData','YData'}
            oldX = get(A, 'XData');
            oldY = get(A, 'YData');
            editlineObj = A.editline;
            A.editline = set(editlineObj, varargin{:});
            newX = get(A, 'XData');
            newY = get(A, 'YData');
            % 76 78
            dX = minus(newX, oldX);
            dY = minus(newY, oldY);
            dX = dX(find(dX));
            dY = dY(find(dY));
            fMove = or(eq(length(dX), 4.0), eq(length(dY), 4.0));
            if fMove
                myBin.Items
                for anObjH=myBin.Items
                    if not(isempty(dX))
                        X = get(anObjH, 'XData');
                        X = plus(X, dX(1.0));
                        set(anObjH, 'XData', X);
                    end % if
                    if not(isempty(dY))
                        Y = get(anObjH, 'YData');
                        Y = plus(Y, dY(1.0));
                        set(anObjH, 'YData', Y);
                    end % if
                end % for
            else
                width = range(oldX);
                height = range(oldY);
                left = min(oldX);
                bottom = min(oldY);
                for anObjH=myBin.Items
                    if not(isempty(dX))
                        X = get(anObjH, 'XData');
                        X = plus(X, mrdivide(mtimes(dX(1.0), minus(mean(X), left)), width));
                        set(anObjH, 'XData', X);
                    end % if
                    if not(isempty(dY))
                        Y = get(anObjH, 'YData');
                        Y = plus(Y, mrdivide(mtimes(dY(1.0), minus(mean(Y), bottom)), height));
                        set(anObjH, 'YData', Y);
                    end % if
                end % for
            end % if
        otherwise
            % 115 117
            editlineObj = A.editline;
            A.editline = set(editlineObj, varargin{:});
        end % switch
    end % while
