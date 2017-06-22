function A = set(A, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if gt(nargin, 1.0)
        arg1 = varargin{1.0};
        if isa(arg1, 'char') && eq(nargin, 3.0)
            switch varargin{1.0}
            case 'SavedState'
                A.SavedState = varargin{2.0};
                return;
            case 'ObjBin'
                A.ObjBin = varargin{2.0};
                return;
            case 'IsSelected'
                A.ObjSelected = varargin{2.0};
                myH = get(A, 'MyHandle');
                figH = get(myH, 'Figure');
                figObjH = getobj(figH);
                if not(isempty(figObjH))
                    dragBinH = figObjH.DragObjects;
                    currentSelection = dragBinH.Items;
                    if varargin{2.0}
                        if isempty(currentSelection) || not(any(eq(currentSelection, myH)))
                            set(A, 'Selected', 'on');
                            dragBinH.NewItem = myH;
                        end % if
                    else
                        if not(isempty(currentSelection)) && any(eq(currentSelection, myH))
                            set(A, 'Selected', 'off');
                            dragBinH.RemoveItem = myH;
                        end % if
                    end % if
                end % if
                return;
            case 'Draggable'
                A.Draggable = varargin{2.0};
                return;
            case 'DragConstraint'
                A.DragConstraint = varargin{2.0};
                return;
            case 'MyHGHandle'
                A.HGHandle = varargin{2.0};
                return;
            end % switch
            HGObj = A.HGHandle;
            set(HGObj, varargin{:});
        end % if
        % 51 53
        if isa(arg1, 'cell')
            property = varargin{2.0};
            values = varargin{3.0};
            if not(isa(values, 'cell'))
                values = cellhorzcat(values);
            end % if
            for idx=1.0:length(arg1{1.0})
                B = A(arg1{1.0}(idx));
                B = set(B, property, values{idx});
            end % for
        else
            HGObj = A.HGHandle;
            set(HGObj, varargin{:})
        end % if
    else
        HGObj = A.HGHandle;
        set(HGObj);
    end % if
